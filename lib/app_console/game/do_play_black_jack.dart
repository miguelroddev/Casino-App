import 'dart:collection';
import 'dart:io';
import 'dart:async';

import 'package:casino_app/app_console/exception/app_invalid_entry_exception.dart';
import 'package:casino_app/core/card/deck.dart';
import 'package:casino_app/core/card/hand.dart';
import 'package:casino_app/core/casino_manager.dart';
import 'package:casino_app/core/config.dart';
import 'package:casino_app/core/game/bj_game_states/bj_end_state.dart';
import 'package:casino_app/core/game/bj_game_states/bj_start_round_state.dart';
import 'package:casino_app/core/game/black_jack.dart';
import 'package:casino_app/core/game/events/handle_bet_event.dart';
import 'package:casino_app/core/game/events/player_decision_event.dart';
import 'package:casino_app/core/game/events/player_round_start_decision_event.dart';
import 'package:casino_app/core/player/player.dart';
import 'package:casino_app/core/round/bj21_round.dart';

class DoPlayBlackJack {

  BlackJack startupGame(CasinoManager casinoManager){
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
    return BlackJack(_numDecks, _players);
  }

  void printHands(List<Hand> Hands){
    int i =1;
    for (Hand hand in Hands){
      print("Hand number $i: ");
      hand.printHand();
      i++;
    }
  }

  Future<void> execute(CasinoManager casinoManager) async{
    if (isConsoleMode) {
      try{
        BlackJack _game = startupGame(casinoManager);
        final streamSub = _game.stream.listen((event) async {
          print(event.toConsolePrint());
          if (event is PlayerDecisionEvent) {
            final choice = stdin.readLineSync()?.toUpperCase() ?? '';
            event.completer.complete(choice);
          }
          else if (event is PlayerRoundStartDecisionEvent) {
            final choice = stdin.readLineSync()?.toUpperCase() ?? '';
            event.completer.complete(choice);
          }
          else if (event is HandleBetEvent) {
            final input = stdin.readLineSync()?.toUpperCase() ?? '';
            event.completer.complete(input);
          }
        });
        _game.updateGameState(BJStartRoundState(_game));
        while (true){
          await _game.gameState!.execute();
          if (_game.gameState is BJEndState){
            break;
          }
        }
        await streamSub.cancel();
        _game.dispose();
        print("GAME HAS ENDED");
      } catch (e){
        print(e.toString());
      }
      

    }


  }
}