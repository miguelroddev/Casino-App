import 'dart:io';

import 'package:casino_app/core/casino_manager.dart';
import 'package:casino_app/core/config.dart';
import 'package:casino_app/core/player/player.dart';

class DoPlayBlackJack {
  void execute(CasinoManager casinoManager){
    if (isConsoleMode) {
      stdout.write("Insert Player ID");
      String? input = stdin.readLineSync();
      int? playerID = int.tryParse(input ?? '');
      if (playerID == null || playerID <= 0){
      //throw InvalidPlayerIdException
      }
      Player player = casinoManager.getPlayer(playerID!);
      

    } //else flutter logic 

  }
}