import 'package:casino_app/core/casino_manager.dart';
import 'package:casino_app/core/player/player.dart';
import 'package:flutter/material.dart';

class GamePage extends StatefulWidget {
  final int playerID;
  final CasinoManager casinoManager;
  const GamePage({super.key, required this.playerID, required this.casinoManager});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  late final int playerID;

  @override
  void initState(){
    playerID = widget.playerID;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Game Menu",
      style: TextStyle(fontFamily: "Play", 
      color: Color(0xFFFFBB00),
      fontSize: 50),
      )
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/homepage_background.png"), 
            fit: BoxFit.cover,
          ),
        ),
        child: GridView.count(
          padding: const EdgeInsets.all(16),
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.82,
          children: [
            
            ImageTextButton(
              imagePath: 'assets/Black Jack icon v2.jpg',
              label: 'Blackjack',
              onPressed: () {

              },
            ),
            ImageTextButton(
              imagePath: 'assets/Roulette icon v2.jpg',
              label: 'Roulette',
              onPressed: () {
                
              },
            ),
          ],
        ),
      )
    );
  }
}

class ImageTextButton extends StatelessWidget {
  final String imagePath;
  final String label;
  final VoidCallback onPressed;

  const ImageTextButton({
    super.key,
    required this.imagePath,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          iconSize: 140,
          padding: EdgeInsets.zero,
          icon: Image.asset(
            imagePath,
            fit: BoxFit.contain,
          ),
          onPressed: onPressed,
        ),
        const SizedBox(height: 8),
        Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontFamily: "PlayFair",
            color: Color(0xFFFFBB00),
            fontSize: 22,
          ),
        ),
      ],
    );
  }
}