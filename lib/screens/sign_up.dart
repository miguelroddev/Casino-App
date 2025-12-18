import 'package:flutter/material.dart';
import 'package:casino_app/core/exceptions/username_already_exists_exception.dart';
import 'package:casino_app/core/exceptions/invalid_credentials_exception.dart';
import 'package:casino_app/core/casino_manager.dart';
import 'package:hive/hive.dart';

class SignUp extends StatefulWidget {
  final CasinoManager casinoManager;
  const SignUp({super.key, required this.casinoManager});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

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

  Future<void> _submitSignUp() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;

    final username = _usernameCtrl.text.trim();
    final password = _passwordCtrl.text;

    setState(() => _isLoading = true);

    try {
      widget.casinoManager.createPlayer(username, password);
      await widget.casinoManager.saveCasino();

      if (!mounted) return;
      _showSnack("Account created successfully!");

    } on UsernameAlreadyExistsException catch (e) {
      _showSnack(e.toString());
    } on InvalidCredentialsException catch (e) {
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
              title: const Text("Sign Up", 
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
                        _submitSignUp();
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