import 'package:casino_app/core/card/card.dart';
import 'package:casino_app/core/card/deck.dart';
import 'package:casino_app/core/game/bj_end_state.dart';
import 'package:casino_app/core/game/bj_game_state.dart';
import 'package:casino_app/core/game/bj_start_round_state.dart';
import 'package:casino_app/core/game/black_jack.dart';
import 'package:casino_app/core/game/events/dealer_draws_card_event.dart';
import 'package:casino_app/core/game/events/dealer_reveal_hidden_card_event.dart';
import 'package:casino_app/core/game/events/show_dealer_final_value_event.dart';
import 'package:casino_app/core/player/player.dart';
import 'package:casino_app/core/round/bj21_round.dart';

class BJDealerPlayState extends BJGameState{
  BlackJack _game;

  BJDealerPlayState(this._game);

  @override
  Future<void> execute()async{
    BlackJackRound _bjRound = _game.round;
    Set<Player> _setPlayers = _bjRound.players;
    Deck _deck = _game.deck;

    Card temp = _bjRound.revealDealerHiddenCard();
    await _game.emit(DealerRevealHiddenCardEvent("", temp, _bjRound.dealer));
    int _valueDealer = _game.calculateHand(_bjRound.dealer);
    if(_valueDealer < 17 && _bjRound.numberOfBusted != _bjRound.getNumberOfHands()){
      while (_game.calculateHand(_bjRound.dealer) < 17){
        temp = _bjRound.addDealerCard();
        await _game.emit(DealerDrawsCardEvent("", _bjRound.dealer, temp, null));
      }
    }
    int dealerValue = _game.calculateHand(_bjRound.dealer);
    await _game.emit(ShowDealerFinalValueEvent("Dealer Value is: $dealerValue", dealerValue));
    await _game.settleRound(_game.calculateHand(_bjRound.dealer)); // already does the payout automatically
    _game.endGame();
    _game.updateGameState(BJStartRoundState(_game));
    
  }
}