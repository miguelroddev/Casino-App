import 'package:casino_app/core/card/card.dart';
import 'package:casino_app/core/card/deck.dart';
import 'package:casino_app/core/game/bj_end_state.dart';
import 'package:casino_app/core/game/bj_game_state.dart';
import 'package:casino_app/core/game/bj_start_round_state.dart';
import 'package:casino_app/core/game/black_jack.dart';
import 'package:casino_app/core/player/player.dart';
import 'package:casino_app/core/round/bj21_round.dart';

class BJDealerPlayState extends BJGameState{
  BlackJack _game;

  BJDealerPlayState(this._game);

  @override
  void execute(){
    BlackJackRound _bjRound = _game.round;
    Set<Player> _setPlayers = _bjRound.players;
    Deck _deck = _game.deck;

    _bjRound.revealDealerHiddenCard();
    _bjRound.printDealer();
    int _valueDealer = _game.calculateHand(_bjRound.dealer);
    if(_valueDealer < 17 && _bjRound.numberOfBusted != _bjRound.getNumberOfHands()){
      while (_game.calculateHand(_bjRound.dealer) < 17){
        _bjRound.addDealerCard();
        _bjRound.printDealer();
      }
    }
    print("Dealer Value is: ${_game.calculateHand(_bjRound.dealer)}");
    _game.settleRound(_game.calculateHand(_bjRound.dealer)); // already does the payout automatically
    _game.endGame();
    _game.updateGameState(BJStartRoundState(_game));
  }
}