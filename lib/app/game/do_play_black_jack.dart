import 'dart:collection';
import 'dart:io';

import 'package:casino_app/app/exception/app_invalid_entry_exception.dart';
import 'package:casino_app/core/casino_manager.dart';
import 'package:casino_app/core/config.dart';
import 'package:casino_app/core/game/bj_end_state.dart';
import 'package:casino_app/core/game/bj_start_round_state.dart';
import 'package:casino_app/core/game/black_jack.dart';
import 'package:casino_app/core/player/player.dart';
import 'package:casino_app/core/round/bj21_round.dart';

class DoPlayBlackJack {
  void execute(CasinoManager casinoManager){
    if (isConsoleMode) {
      try{
        stdout.write("Insert Player ID: ");
        String? _input = stdin.readLineSync();
        int? _playerID = int.tryParse(_input ?? '');
        if (_playerID == null){
          throw AppInvalidEntryException();
        }
        Player player = casinoManager.getPlayer(_playerID!);
        
        stdout.write("Insert Number of Decks: ");
        String? _input2 = stdin.readLineSync();
        int? _numDecks = int.tryParse(_input2 ?? '');
        if (_numDecks == null){
          throw AppInvalidEntryException();
        }
        stdout.write("Insert Cash-in Value: ");
        String? _input3 = stdin.readLineSync();
        double? _sessionMoney = double.tryParse(_input3 ?? '');
        if (_sessionMoney == null){
          throw AppInvalidEntryException();
        }
        player.addSessionMoney(_sessionMoney!);
        Set<Player> _players = new HashSet();
        _players.add(player);
        BlackJack _game = BlackJack(_numDecks!, _players); 
        _game.updateGameState(BJStartRoundState(_game));
        while (true){
          _game.gameState!.execute();
          if (_game.gameState is BJEndState){
            break;
          }
        }
        print("GAME HAS ENDED");
      } catch (e){
        print(e.toString());
      }
      

    } //else flutter logic 

  }
}