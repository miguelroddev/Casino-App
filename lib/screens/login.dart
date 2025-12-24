import 'package:casino_app/core/casino_manager.dart';
import 'package:casino_app/core/exceptions/password_incorrect_exception.dart';
import 'package:casino_app/core/exceptions/username_doesnt_exist_exception.dart';
import 'package:casino_app/core/player/player.dart';
import 'package:casino_app/data/user_session.dart';
import 'package:casino_app/screens/user_home.dart';
import 'package:casino_app/services/auth_service.dart';
import 'package:casino_app/services/session_repository.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Login extends StatefulWidget {
  final CasinoManager casinoManager;
  const Login({super.key, required this.casinoManager});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  late final AuthService authService;

  @override
  void initState() {
    super.initState();
    final sessionBox = Hive.box<Session>('sessionBox');
    final sessionRepo = SessionRepository(sessionBox);
    authService = AuthService(
      casinoManager: widget.casinoManager,
      sessionRepo: sessionRepo,
    );
  }

  final _formKey = GlobalKey<FormState>();

  final _usernameCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  final _confirmCtrl = TextEditingController();

  bool _isLoading = false;

  @override
  void dispose() {
    _usernameCtrl.dispose();
    _passwordCtrl.dispose();
    _confirmCtrl.dispose();
    super.dispose();
  }

  void _showSnack(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  Future<void> _submitLogin() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;

    final username = _usernameCtrl.text.trim();
    final password = _passwordCtrl.text;

    setState(() => _isLoading = true);

    try {
      final Player player = await authService.login(username, password);

      if (!mounted) return;
      Navigator.pushNamedAndRemoveUntil(
        context,
        "/user_home",
        (route) => false,
        arguments: player,
      );
    } on UsernameDoesntExistException catch(e){
      _showSnack(e.toString());
    } on PasswordIncorrectException catch (e){
      _showSnack(e.toString());
    } catch (e) {
      _showSnack("Unexpected error: ${e.toString()}");
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/login_background.png"), 
            fit: BoxFit.cover,
          ),
        ),
        child : SafeArea(
          child: Column(children: [
            AppBar(
              backgroundColor: Colors.transparent,
              iconTheme: const IconThemeData(color: Color(0xFFFFBB00), size: 42),
              title: const Text("Login", 
              style:TextStyle(color: Color(0xFFFFBB00),
              fontSize: 40, fontFamily:"MontSerrat",
              fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(0, 130, 0, 0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _usernameCtrl,
                        decoration: const InputDecoration(labelText: "Username",),
                        validator: (v) {
                          final value = (v ?? "").trim();
                          if (value.isEmpty) return "Username is required";
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _passwordCtrl,
                        obscureText: true,
                        decoration: const InputDecoration(labelText: "Password",),
                        validator: (v) {
                          final value = (v ?? "").trim();
                          if (value.isEmpty) return "Password is required";
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 40),
                    SizedBox(
                      width: 250,
                      height: 60,
                      child: TextButton(onPressed:() {
                        _submitLogin();
                      }, child: const Text("Confirm",
                      style: TextStyle(color: Color(0xFFFFBB00),
                      fontSize: 22),)),
                    ),
                    ],
                ),
              )
            ),
            ],
          )
        ),
      )
    );
  }
}