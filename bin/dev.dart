// the goal of this file is to firstly test the game logic with the console!

import 'dart:io';
import 'package:casino_app/app/main_menu.dart';
import 'package:casino_app/core/casino.dart';
import 'package:casino_app/core/casino_manager.dart';
import 'package:casino_app/core/config.dart';

void main() {
  isConsoleMode = true;
  CasinoManager casinoManager = CasinoManager(Casino());
  MainMenu().start(casinoManager);
}