import 'package:casino_app/core/casino_manager.dart';
import 'package:casino_app/core/player/player.dart';
import 'package:casino_app/screens/game_page.dart';
import 'package:casino_app/screens/home_tab.dart';
import 'package:casino_app/screens/profile_page.dart';
import 'package:flutter/material.dart';

class UserHome extends StatefulWidget {
  final Player player;
  final CasinoManager casinoManager;
  const UserHome({super.key, required this.player, required this.casinoManager});

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  int _selectedIndex = 0;
  late final Player player;
  late final CasinoManager casinoManager;
  

  @override
  void initState() {
    super.initState();
    player = widget.player;
    casinoManager = widget.casinoManager;
  }
  
  @override
  Widget build(BuildContext context) {
    final _pages = [
      HomeTab(player: player, casinoManager: casinoManager),
      GamePage(player: player),
      ProfilePage(player: player),
    ];
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      extendBody: true,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.casino),
            label: 'Games',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
