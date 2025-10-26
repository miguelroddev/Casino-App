import 'dart:collection';

import 'package:casino_app/core/date/date.dart';
import 'package:casino_app/core/exceptions/no_such_player_exception.dart';
import 'package:casino_app/core/player/player.dart';

class Casino {
  int _casinoProfit = 0;
  int _sessionID = 0;
  Date _date = new Date(1);
  Map<int, Player> mapPlayers = new HashMap();

  Casino();

  //getter
  Date get date => _date;
  int get sessionID => _sessionID;
  int get casinoProfit => _casinoProfit;

  Player getPlayer(int idPlayer){
    if (mapPlayers[idPlayer] == null){
      throw NoSuchPlayerException(idPlayer);
    }
    return mapPlayers[idPlayer]!;
  }

  void increaseSessionID(){
    _sessionID+=1;
  }

  void increaseProfit(int money){
    _casinoProfit += money;
  }

  void changeDate(int days){
    _date.advanceDay(days);
  }
}