import 'dart:collection';

import 'package:casino_app/core/card/card.dart';
import 'package:casino_app/core/card/hand.dart';
import 'package:casino_app/core/game/game.dart';
import 'package:casino_app/core/player/player.dart';
import 'package:casino_app/core/round/round.dart';

class BlackJackRound extends Round{
  Map<int, List<Hand>> _mapPlayerHand = new HashMap();
  List<Hand> _dealer = [];
  late Card _dealerHiddenCard;

  BlackJackRound(int idRound, Game _game, Set<Player> _players):super(idRound, _game, _players){}

  //getters
  List<Hand> get dealer => _dealer;


  // takeCard != Hit, takeCard is automatic/beggining of the round

  takeCard(int idOfPlayer){
    bool idExists = false;
    for (Player player in players){
      if (player.idPlayer == idOfPlayer){
        idExists = true;
      }
    }
    if (idExists == false){
      //throw PlayerNotInRoundException
    }
  }

  void removePlayer(int playerID) {
    players.removeWhere((player) => player.idPlayer == playerID);
  }

  void bet(Player player, int money){
    player.bet(money);
  }

  List<Hand> getHands(int idPlayer){
    if (_mapPlayerHand[idPlayer] == null){
      //throw PlayerNotInRoundException
    }
    return _mapPlayerHand[idPlayer]!;
  }
  
}