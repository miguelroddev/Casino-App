

import 'dart:collection';

import 'package:casino_app/core/game/game_type.dart';
import 'package:casino_app/core/player/player.dart';
import 'package:casino_app/core/round/round.dart';

abstract class Game{
  final GameType gameType;
  late Round _round;
  Set<Round> _previousRounds = new HashSet();

  Game(this.gameType);

  //getters
  Round get round => _round;
  Set<Round> get previousRounds => _previousRounds;
  Set<Player> get getPlayers => _round.players;

  void setRound(Round round){
    _round = round;
  }

  void endGame();

}