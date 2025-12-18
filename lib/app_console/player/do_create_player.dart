import 'package:casino_app/app_console/exception/app_invalid_entry_exception.dart';
import 'package:casino_app/core/casino_manager.dart';
import 'dart:io';

import 'package:casino_app/core/player/player.dart';

class DoCreatePlayer {


  Future<void> execute(CasinoManager casinoManager) async{
    try{
      print("Insert Username: ");
      String? _username = stdin.readLineSync();
      if (_username == null || _username.isEmpty){
        throw AppInvalidEntryException();
      }
      print("Insert Password: ");
      String? _password = stdin.readLineSync();
      if (_password == null || _password.isEmpty){
        throw AppInvalidEntryException();
      }
      casinoManager.createPlayer(_username!, _password!);
    } catch(e){
      print(e.toString());
    }
    

  }
}