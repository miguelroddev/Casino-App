import 'package:casino_app/core/casino_manager.dart';
import 'package:casino_app/core/player/player.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class HomeTab extends StatefulWidget {
  final Player player;
  final CasinoManager casinoManager;
  const HomeTab({super.key, required this.player, required this.casinoManager});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  late final Player player;
  late final CasinoManager casinoManager;

  @override
  void initState(){
    player = widget.player;
    casinoManager = widget.casinoManager;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(title: Text("Welcome ${player.username} \nDay ${casinoManager.date.day}"), titleSpacing: 2,),
      body: Container(
        padding: const EdgeInsets.all(16),
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/homepage_background.png"), 
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Container(
              
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFFFFFFFF).withValues(alpha: 0.05),
              
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${player.username} is ${player.playerType.toString()}",
                    style: const TextStyle(
                      color: Color(0xFFFFBB00),
                      fontSize: 22,
                      fontFamily: "PlayFair",
                    ),
                  ),
                  Text(
                    "Current Bankroll\n •  ${player.bankroll} €",
                    style: const TextStyle(
                      color: Color(0xFFFFBB00),
                      fontSize: 22,
                      fontFamily: "Play",
                    ),
                  ),
                  const SizedBox(height: 50),
                  const Text(
                    "Gotta Insert the graph here",
                    style: const TextStyle(
                      color: Color(0xFFFFBB00),
                      fontSize: 22,
                      fontFamily: "Play",
                    ),
                  ),
                  const SizedBox(height: 50),
                  
                ],
              ),
            ),
            TextButton(onPressed: () {
                    casinoManager.changeDate(1);
                    setState(() {});
                  }, child: Text("Advance day", style: TextStyle(fontSize: 25),),),
            TextButton(onPressed: () {
              player.increaseBankRoll(1000);
              setState(() {});
            }, child: Text("Add 1000€", style: TextStyle(fontSize: 25),),)
          ],
        )
      )
    );
  }
}