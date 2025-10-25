import 'dart:collection';
import 'package:casino_app/core/card/hand.dart';
import 'package:casino_app/core/player/player.dart';
import 'package:casino_app/core/game/game.dart';

class Round {
  final int idRound;
  Game _game;
  Set<Player> _players;
  Map<int, Set<Hand>> _mapPlayerHand = new HashMap();

  Round(this.idRound, this._game, this._players){}
  
  //getters
  Game get game => _game;
  Set<Player> get players => _players;
  

  // int aposta(Player player, int valor){
  //   player
  // }
}