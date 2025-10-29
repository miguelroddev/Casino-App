import 'package:casino_app/core/config.dart';
import 'package:casino_app/core/game/bj_game_state.dart';
import 'package:casino_app/core/game/black_jack.dart';
import 'package:casino_app/core/game/options_start_round.dart';
import 'dart:io';

import 'package:casino_app/core/player/player.dart';

class BJStartRoundState extends BJGameState{
  BlackJack _game;

  BJStartRoundState(this._game);

  @override
  void execute(){
    if (isConsoleMode){
      bool invalido = true;
      for (Player player in _game.round.players){
       do {
        OptionsStartRound? _option;
        stdout.write("Available Options for ${player.username}:\n " +
        "1. Clear\n" + "2. Add Bet" + "3. Confirm\n" + "4. Exit\n");
        String? input = stdin.readLineSync();
        if (input == "1"){
          int onTableAmount = player.totalMoneyBetted
          player.increaseSess();
        }
        } while (invalido == true); 
      }
    }
  }
}