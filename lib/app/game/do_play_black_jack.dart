import 'dart:collection';
import 'dart:io';

import 'package:casino_app/core/casino_manager.dart';
import 'package:casino_app/core/config.dart';
import 'package:casino_app/core/game/black_jack.dart';
import 'package:casino_app/core/player/player.dart';
import 'package:casino_app/core/round/bj21_round.dart';

class DoPlayBlackJack {
  void execute(CasinoManager casinoManager){
    if (isConsoleMode) {
      stdout.write("Insert Player ID: ");
      String? _input = stdin.readLineSync();
      int? _playerID = int.tryParse(_input ?? '');
      if (_playerID == null || _playerID <= 0){
      //throw InvalidPlayerIdException
      }
      Player player = casinoManager.getPlayer(_playerID!);
      
      stdout.write("Insert Number of Decks: ");
      String? _input2 = stdin.readLineSync();
      int? _numDecks = int.tryParse(_input2 ?? '');
      if (_numDecks == null || _numDecks <= 0){
      //throw InvalidNumberOfDecksException
      //maybe I should also check if they are whole numbers
      }
      Set<Player> _players = new HashSet();
      _players.add(player);
      BlackJack _game = BlackJack(_numDecks!, _players); 
      // while (game.checkGameEnd() == false){
        
      // }

    } //else flutter logic 

  }
}