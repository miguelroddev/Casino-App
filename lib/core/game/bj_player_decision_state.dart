import 'package:casino_app/core/card/deck.dart';
import 'package:casino_app/core/game/bj_game_state.dart';
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
    }
    _bjRound.addDealerCard();
    for(Player player in _setPlayers){
      _bjRound.takeCard(player.idPlayer);
    }
    _bjRound.addDealerHiddenCard();

    //check BlackJack
    
  }
}