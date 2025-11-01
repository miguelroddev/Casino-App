import 'dart:io';

import 'package:casino_app/core/casino_manager.dart';
import 'package:casino_app/core/player/player.dart';

class DoAddBankroll {
  void execute(CasinoManager casinoManager){
    print("Insert PlayerID: ");
    String? _input = stdin.readLineSync();
    int? _playerID = int.tryParse(_input ?? '');
    if (_playerID == null || _playerID <= 0){
      //throw InvalidPlayerIDException
    }
    Player player = casinoManager.getPlayer(_playerID!);
    print("Insert Amount: ");
    String? _input2 = stdin.readLineSync();
    double? _money = double.tryParse(_input2 ?? '');
    if (_money == null || _money <= 0){
      //throw InvalidMoneyAmountException
    }
    player.increaseBankRoll(_money!);
  }
}