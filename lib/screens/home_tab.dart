import 'package:casino_app/core/player/player.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatefulWidget {
  final Player player;
  const HomeTab({super.key, required this.player});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  late final Player player;

  @override
  void initState(){
    player = widget.player;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(title: Text("Welcome ${player.username}")),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/homepage_background.png"), 
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Text("")
        )
      )
    );
  }
}