import 'dart:io';

import 'package:casino_app/core/casino_manager.dart';

class DoPlayBlackJack {
  void execute(CasinoManager casinoManager){
    stdout.write("Insert Player ID");
    String? input = stdin.readLineSync();
    int? playerID = int.tryParse(input ?? '');
    if (playerID == null || playerID <= 0){
      //throw InvalidPlayerIdException
    }
    if (){}
  }
}