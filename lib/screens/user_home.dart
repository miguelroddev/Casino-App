import 'package:casino_app/core/player/player.dart';
import 'package:flutter/material.dart';

class UserHome extends StatefulWidget {
  final Player player;
  const UserHome({super.key, required this.player});

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  
  late final Player player;
  
  @override
  void initState() {
    super.initState();
    player = widget.player;
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Welcome ${player.username}")),
      body: const SizedBox(),
    );
  }
}