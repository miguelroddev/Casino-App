import 'package:casino_app/core/player/player.dart';
import 'package:casino_app/data/user_session.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class ProfilePage extends StatefulWidget {
  final Player player;
  const ProfilePage({super.key, required this.player});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  
  late final Player player;

  @override
  void initState(){
    player = widget.player;
    super.initState();
  }

  Future<void> _logout() async {
    final box = Hive.box<Session>('sessionBox');
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
                onPressed: (){_logout();}, 
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