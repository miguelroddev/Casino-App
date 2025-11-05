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
import 'package:casino_app/core/game/events/dealer_draws_card_event.dart';
import 'package:casino_app/core/game/events/player_draws_card_event.dart';
import 'package:casino_app/core/player/player.dart';
import 'package:casino_app/core/round/bj21_round.dart';

class BJPlayerDecisionState extends BJGameState{
  BlackJack _game;

  BJPlayerDecisionState(this._game);

  @override
  void execute() async{
    
    BlackJackRound _bjRound = _game.round;
    Set<Player> _setPlayers = _bjRound.players;
    Deck _deck = _game.deck;
    
    for(Player player in _setPlayers){
      Card temp = _bjRound.takeCard(player.idPlayer);
      _game.emit(PlayerDrawsCardEvent("Player ${player.username}'s cards: ",
      player, _bjRound.getHand(player.idPlayer).cards, temp));
    }

    Card dealerCard = _bjRound.addDealerCard();
    _game.emit(DealerDrawsCardEvent("Dealer's cards: ", 
    _bjRound.dealer, dealerCard, _bjRound.dealerHiddenCard));
    
    for(Player player in _setPlayers){
      Card temp = _bjRound.takeCard(player.idPlayer);
      _game.emit(PlayerDrawsCardEvent("Player ${player.username}'s cards: ",
      player, _bjRound.getHand(player.idPlayer).cards, temp));
    }
    
    _bjRound.addDealerHiddenCard();
    _game.emit(DealerDrawsCardEvent("Dealer's cards: ", 
    _bjRound.dealer, null, _bjRound.dealerHiddenCard));
    _game.applyPlayerBetsToHands();

    //GAME STATE check BlackJack
    List<Card> temp = List<Card>.from(_bjRound.dealer);
    temp.add(_bjRound.dealerHiddenCard!);
    int _valueDealer = _game.calculateHand(temp);
    if (_valueDealer == 21){
      if (_bjRound.dealerHiddenCard != null){
        Card temp = _bjRound.removeHiddenCard();
        _game.emit(DealerDrawsCardEvent("Dealer's cards: ", 
        _bjRound.dealer, temp, _bjRound.dealerHiddenCard));
      }
      //ALSO BIG GAME STaTE HAS A LOT OF PRINTS
      _game.settleRound(_valueDealer);
      _game.endGame();
      _game.updateGameState(BJStartRoundState(_game));
    }
    else{
      //SUPER BIG GAME STATE ALMOST NEVER ENDS
      _game.playerDecisions();
    }
    _game.updateGameState(BJDealerPlayState(_game));    
  }
}