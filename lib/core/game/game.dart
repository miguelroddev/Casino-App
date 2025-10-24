

import 'dart:collection';

import 'package:casino_app/core/game/game_type.dart';
import 'package:casino_app/core/round/round.dart';

abstract class Game{
  abstract final GameType gameType;
  abstract Round _ronda;
  Set _previousRounds = new HashSet();

  void endGame();
  void checkGameEnd();
  void startRound();

}