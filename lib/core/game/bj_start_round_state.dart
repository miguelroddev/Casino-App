import 'package:casino_app/core/config.dart';
import 'package:casino_app/core/exceptions/invalid_entry_exception.dart';
import 'package:casino_app/core/game/bj_dealer_play_state.dart';
import 'package:casino_app/core/game/bj_end_state.dart';
import 'package:casino_app/core/game/bj_game_state.dart';
import 'package:casino_app/core/game/bj_player_decision_state.dart';
import 'package:casino_app/core/game/black_jack.dart';
import 'dart:io';

import 'package:casino_app/core/player/player.dart';

class BJStartRoundState extends BJGameState{
  BlackJack _game;

  BJStartRoundState(this._game);

  
  void handleBet(Player player){
    stdout.write("Insert Amount to Bet: ");
    String? input2 = stdin.readLineSync();
    double? _money = double.tryParse(input2 ?? '');
    if (_money == null){
      throw InvalidEntryException();
    }
    player.bet(_money!);
    print("Current Session money:"+ player.totalMoneyBetted.toString());
  }

  @override
  void execute(){
    if (isConsoleMode){
      List<Player> toRemove = [];
      for (Player player in _game.getPlayers){
        bool invalido = true;
        do {
          stdout.write("Available Options for ${player.username}:\n" +
          "1. Clear\n" + "2. Add Bet\n" + "3. Confirm\n" + "0. Exit\n");
          String? input = stdin.readLineSync();
          if (input == "1"){
            player.clearBet();
          }
          else if (input == "2"){
            try {
              handleBet(player);
            } catch (e){
              print(e.toString());
            }
          }
          else if (input == "3"){
            invalido = false;
          }
          else if (input == "0"){
            invalido = false;
            player.finishSession();
            toRemove.add(player);
          }
          else {
            print("Invalid option. Please try again.");
          }
        } while (invalido == true);
      }
      for (Player player in toRemove) {
        _game.removePlayer(player.idPlayer);
      }
      if (_game.getPlayers.isEmpty){
        _game.updateGameState(BJEndState(_game));
      }
      else{
        _game.updateGameState(BJPlayerDecisionState(_game));
      }
    }
  }
}