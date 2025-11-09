import 'package:casino_app/core/game/bj_game_states/bj_game_state.dart';
import 'package:casino_app/core/game/black_jack.dart';

class BJEndState extends BJGameState{
  BlackJack _game;

  BJEndState(this._game);

  @override
  Future<void> execute()async{}
}