

import 'dart:collection';

import 'package:casino_app/core/game/game_type.dart';
import 'package:casino_app/core/round/round.dart';

abstract class Game{
  final GameType gameType;
  Round _round;
  Set<Round> _previousRounds = new HashSet();

  Game(this.gameType, this._round);

  void endGame();
  void checkGameEnd();
  void startRound();

}