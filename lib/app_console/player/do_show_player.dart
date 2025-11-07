import 'dart:io';

import 'package:casino_app/app_console/exception/app_invalid_entry_exception.dart';
import 'package:casino_app/core/casino_manager.dart';
import 'package:casino_app/core/player/player.dart';

class DoShowPlayer {
  Future<void> execute(CasinoManager casinoManager) async{
    try{
      print("Insert PlayerID: ");
      String? _input = stdin.readLineSync();
      int? _playerID = int.tryParse(_input ?? '');
      if (_playerID == null){
        throw AppInvalidEntryException();
      }
      Player player = casinoManager.getPlayer(_playerID!);
      print(player.toString());
    } catch (e){
      print(e.toString());
    }
  }
}