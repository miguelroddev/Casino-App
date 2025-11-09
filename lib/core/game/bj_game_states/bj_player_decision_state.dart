import 'package:casino_app/core/card/card.dart';
import 'package:casino_app/core/card/deck.dart';
import 'package:casino_app/core/card/hand.dart';
import 'package:casino_app/core/config.dart';
import 'package:casino_app/core/game/bj_game_states/bj_dealer_play_state.dart';
import 'package:casino_app/core/game/bj_game_states/bj_end_state.dart';
import 'package:casino_app/core/game/bj_game_states/bj_game_state.dart';
import 'package:casino_app/core/game/bj_game_states/bj_start_round_state.dart';
import 'package:casino_app/core/game/black_jack.dart';
import 'package:casino_app/core/game/events/dealer_draws_card_event.dart';
import 'package:casino_app/core/game/events/player_draws_card_event.dart';
import 'package:casino_app/core/player/player.dart';
import 'package:casino_app/core/round/bj21_round.dart';

class BJPlayerDecisionState extends BJGameState{
  BlackJack _game;

  BJPlayerDecisionState(this._game);

  @override
  Future<void> execute() async{
    
    BlackJackRound _bjRound = _game.round;
    Set<Player> _setPlayers = _bjRound.players;
    Deck _deck = _game.deck;
    
    for(Player player in _setPlayers){
      Card temp = _bjRound.takeCard(player.idPlayer);
      await _game.emit(PlayerDrawsCardEvent("Player ${player.username}'s cards: ",
      player, _bjRound.getHand(player.idPlayer).cards, temp));
    }

    Card dealerCard = _bjRound.addDealerCard();
    await _game.emit(DealerDrawsCardEvent("Dealer's cards: ", 
    _bjRound.dealer, dealerCard, _bjRound.dealerHiddenCard));
    
    for(Player player in _setPlayers){
      Card temp = _bjRound.takeCard(player.idPlayer);
      await _game.emit(PlayerDrawsCardEvent("Player ${player.username}'s cards: ",
      player, _bjRound.getHand(player.idPlayer).cards, temp));
    }
    
    _bjRound.addDealerHiddenCard();
    await _game.emit(DealerDrawsCardEvent("Dealer's cards: ", 
    _bjRound.dealer, null, _bjRound.dealerHiddenCard));
    _game.applyPlayerBetsToHands();

    //GAME STATE check BlackJack
    List<Card> temp = List<Card>.from(_bjRound.dealer);
    temp.add(_bjRound.dealerHiddenCard!);
    int _valueDealer = _game.calculateHand(temp);
    if (_valueDealer == 21){
      if (_bjRound.dealerHiddenCard != null){
        Card temp = _bjRound.removeHiddenCard();
        await _game.emit(DealerDrawsCardEvent("Dealer's cards: ", 
        _bjRound.dealer, temp, _bjRound.dealerHiddenCard));
      }
      //ALSO BIG GAME STaTE HAS A LOT OF PRINTS
      await _game.settleRound(_valueDealer);
      _game.endGame();
      _game.updateGameState(BJStartRoundState(_game));
    }
    else{
      //SUPER BIG GAME STATE ALMOST NEVER ENDS
      await _game.playerDecisions();
    }
    _game.updateGameState(BJDealerPlayState(_game));    
  }
}