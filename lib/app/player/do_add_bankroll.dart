import 'dart:io';

import 'package:casino_app/app/exception/app_invalid_entry_exception.dart';
import 'package:casino_app/core/casino_manager.dart';
import 'package:casino_app/core/player/player.dart';

class DoAddBankroll {
  void execute(CasinoManager casinoManager){
    try{
      print("Insert PlayerID: ");
      String? _input = stdin.readLineSync();
      int? _playerID = int.tryParse(_input ?? '');
      if (_playerID == null){
        throw AppInvalidEntryException();
      }
      Player player = casinoManager.getPlayer(_playerID!);
      print("Insert Amount: ");
      String? _input2 = stdin.readLineSync();
      double? _money = double.tryParse(_input2 ?? '');
      if (_money == null){
        throw AppInvalidEntryException();
      }
      player.increaseBankRoll(_money!);
    } catch (e){
      print(e.toString());
    }
  }
}