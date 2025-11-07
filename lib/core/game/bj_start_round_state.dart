import 'package:casino_app/core/config.dart';
import 'package:casino_app/core/exceptions/invalid_entry_exception.dart';
import 'package:casino_app/core/game/bj_dealer_play_state.dart';
import 'package:casino_app/core/game/bj_end_state.dart';
import 'package:casino_app/core/game/bj_game_state.dart';
import 'package:casino_app/core/game/bj_player_decision_state.dart';
import 'package:casino_app/core/game/black_jack.dart';
import 'package:casino_app/core/game/events/found_exception_event.dart';
import 'package:casino_app/core/game/events/handle_bet_event.dart';
import 'package:casino_app/core/game/events/invalid_option_event.dart';
import 'package:casino_app/core/game/events/player_round_start_decision_event.dart';
import 'package:casino_app/core/game/events/sucessful_bet_event.dart';
import 'dart:io';

import 'package:casino_app/core/player/player.dart';

class BJStartRoundState extends BJGameState{
  BlackJack _game;

  BJStartRoundState(this._game);

  
  Future<void> handleBet(Player player) async{
    final event = HandleBetEvent("Insert Amount to Bet: ", player);
    await _game.emit(event);
    final input = await event.completer.future;
    double? _money = double.tryParse(input);
    if (_money == null){
      throw InvalidEntryException();
    }
    player.bet(_money!);
    await _game.emit(SucessfulBetEvent("Current Session money:"+ player.totalMoneyBetted.toString()));
  }

  @override
  Future<void> execute() async{
    if (isConsoleMode){
      List<Player> toRemove = [];
      for (Player player in _game.getPlayers){
        bool invalido = true;
        do {
          final event = PlayerRoundStartDecisionEvent("Available Options for ${player.username}:\n" +
          "1. Clear\n" + "2. Add Bet\n3. Confirm\n" + "0. Exit\n", player);
          await _game.emit(event);
          final input = await event.completer.future;
          if (input == "1"){
            player.clearBet();
          }
          else if (input == "2"){
            try {
              await handleBet(player);
            } catch (e){
              await _game.emit(FoundExceptionEvent(e.toString()));
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
            await _game.emit(InvalidOptionEvent("Invalid Input", player));
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