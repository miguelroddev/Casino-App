import 'dart:collection';
import 'package:casino_app/core/player/player.dart';
import 'package:casino_app/core/game/game.dart';

abstract class Round {
  final int idRound;
  Game _game;
  Set<Player> _players = new LinkedHashSet();


  Round(this.idRound, this._game, this._players){}
  
  //getters
  Game get game => _game;
  Set<Player> get players => _players;

}