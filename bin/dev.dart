// the goal of this file is to firstly test the game logic with the console!

import 'dart:io';
import 'package:casino_app/app_console/main_menu.dart';
import 'package:casino_app/core/casino.dart';
import 'package:casino_app/core/casino_manager.dart';
import 'package:hive/hive.dart';
import 'dart:io';
import 'package:casino_app/core/models/casino_model.dart' as model;
import 'package:casino_app/core/config.dart';

Future<void> main() async {
  final dir = Directory.current.path; // for console mode
  Hive.init(dir);
  Hive
    ..registerAdapter(model.DateAdapter())
    ..registerAdapter(model.PlayerTypeAdapter())
    ..registerAdapter(model.PlayerAdapter())
    ..registerAdapter(model.CasinoAdapter());
  isConsoleMode = true;
  CasinoManager? casinoManager = await CasinoManager.loadCasino();
  casinoManager ??= CasinoManager(Casino());
  MainMenu().start(casinoManager);
  await casinoManager.saveCasino();
  await Hive.close();
}