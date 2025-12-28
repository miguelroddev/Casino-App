import 'package:casino_app/core/player/player.dart';
import 'package:casino_app/screens/game_page.dart';
import 'package:casino_app/screens/home_tab.dart';
import 'package:casino_app/screens/profile_page.dart';
import 'package:flutter/material.dart';

class UserHome extends StatefulWidget {
  final Player player;
  const UserHome({super.key, required this.player});

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  int _selectedIndex = 0;
  late final Player player;
  

  @override
  void initState() {
    super.initState();
    player = widget.player;
  }
  
  @override
  Widget build(BuildContext context) {
    final _pages = [
      HomeTab(player: player),
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
