import 'package:casino_app/core/casino_manager.dart';
import 'dart:io';

import 'package:casino_app/core/player/player.dart';

class DoCreatePlayer {


  void execute(CasinoManager casinoManager){
    print("Insert Username: ");
    String? _username = stdin.readLineSync();
    if (_username == null || _username.length == 0){
    //throw InvalidUsernameException
    }
    print("Insert Email: ");
    String? _email = stdin.readLineSync();
    if (_email == null || _email.length == 0){
    //throw InvalidEmailException
    }
    print("Insert Password: ");
    String? _password = stdin.readLineSync();
    if (_password == null || _password.length == 0){
    //throw InvalidPasswordException
    }
    casinoManager.createPlayer(_username!, _email!, _password!);

  }
}