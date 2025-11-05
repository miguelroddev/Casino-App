import 'dart:io';

import 'package:casino_app/app_console/exception/app_invalid_entry_exception.dart';
import 'package:casino_app/core/casino_manager.dart';
import 'package:casino_app/core/player/player.dart';

class DoDebugShowAllAtributes {
  
  void execute(CasinoManager casinoManager){
    try {
      print("Insert PlayerID: ");
      String? _input = stdin.readLineSync();
      int? _playerID = int.tryParse(_input ?? '');
      if (_playerID == null){
        throw AppInvalidEntryException();
      }
      Player player = casinoManager.getPlayer(_playerID!);
      print("PlayerID: ${player.idPlayer}\n" +
            "Bankroll: ${player.bankroll}\n" +
            "SessionMoney: ${player.sessionMoney}\n" +
            "TotalProfit: ${player.totalProfit}\n" +
            "TotalMoneyBetted: ${player.totalMoneyBetted}\n"
      );
    } catch (e){
      print(e.toString());
    }
    
  }
}