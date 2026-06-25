import 'package:casino_app/core/casino_manager.dart';
import 'package:casino_app/core/player/player.dart';
import 'package:casino_app/data/user_session.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class ProfilePage extends StatefulWidget {
  final int playerID;
  final CasinoManager casinoManager;
  const ProfilePage({super.key, required this.playerID, required this.casinoManager});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  
  late final int playerID;
  late final CasinoManager casinoManager;

  @override
  void initState(){
    playerID = widget.playerID;
    casinoManager = widget.casinoManager;
    super.initState();
  }

  Future<void> _logout(casinoManager) async {
    final box = Hive.box<Session>('sessionBox');
    await casinoManager.saveCasino();
    await box.clear();
    if (!mounted) return;
    Navigator.of(context).pushNamedAndRemoveUntil('/home', (route) => false);
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/homepage_background.png"), 
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [Padding(
              padding: const EdgeInsets.all(80.0),
              child: SizedBox(
              width: 250,
              height: 60,
              child: TextButton(
                onPressed: (){_logout(casinoManager);}, 
                child: const Text("Logout", style: TextStyle(fontSize: 30,
                fontFamily: "Play", color: Color(0xFFFFBB00)),)),
              ),
            )
          ])
        )
      )
    );
  }
}