import 'dart:io';

import 'package:casino_app/core/card/card.dart';
import 'package:casino_app/core/card/deck.dart';
import 'package:casino_app/core/card/hand.dart';
import 'package:casino_app/core/config.dart';
import 'package:casino_app/core/game/bj_dealer_play_state.dart';
import 'package:casino_app/core/game/bj_end_state.dart';
import 'package:casino_app/core/game/bj_game_state.dart';
import 'package:casino_app/core/game/bj_start_round_state.dart';
import 'package:casino_app/core/game/black_jack.dart';
import 'package:casino_app/core/player/player.dart';
import 'package:casino_app/core/round/bj21_round.dart';

class BJPlayerDecisionState extends BJGameState{
  BlackJack _game;

  BJPlayerDecisionState(this._game);

  @override
  void execute(){
    BlackJackRound _bjRound = _game.round;
    Set<Player> _setPlayers = _bjRound.players;
    Deck _deck = _game.deck;
    
    for(Player player in _setPlayers){
      _bjRound.takeCard(player.idPlayer);
      print("Player ${player.username}'s cards: ");
      if(isConsoleMode){
        _bjRound.printHands(_bjRound.getHands(player.idPlayer));
      }
    }
    _bjRound.addDealerCard();
    if(isConsoleMode){
        _bjRound.printDealer();
    }
    for(Player player in _setPlayers){
      _bjRound.takeCard(player.idPlayer);
      print("Player ${player.username}'s cards: ");
      if(isConsoleMode){
        _bjRound.printHands(_bjRound.getHands(player.idPlayer));
      }
    }
    _bjRound.addDealerHiddenCard();
    if(isConsoleMode){
        _bjRound.printDealer();
        print("EMPTY_CARD");
    }
    _game.applyPlayerBetsToHands();

    //check BlackJack
    List<Card> temp = List<Card>.from(_bjRound.dealer);
    temp.add(_bjRound.dealerHiddenCard!);
    int _valueDealer = _game.calculateHand(temp);
    if (_valueDealer == 21){
      if (_bjRound.dealerHiddenCard != null){
        _bjRound.removeHiddenCard();
        if(isConsoleMode){
          _bjRound.printDealer();
        }
      }
      _game.settleRound(_valueDealer);
      _game.endGame();
      _game.updateGameState(BJStartRoundState(_game));
    }
    else{
      _game.playerDecisions();
    }
    _game.updateGameState(BJDealerPlayState(_game));
  }
}