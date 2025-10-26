import 'dart:collection';

import 'package:casino_app/core/date/date.dart';
import 'package:casino_app/core/exceptions/no_such_player_exception.dart';
import 'package:casino_app/core/player/player.dart';

class Casino {
  Date _date = new Date(1);
  Map<int, Player> mapPlayers = new HashMap();

  Casino();

  //getter
  Date get date => _date;

  Player getPlayer(int idPlayer){
    if (mapPlayers[idPlayer] == null){
      throw NoSuchPlayerException(idPlayer);
    }
    return mapPlayers[idPlayer]!;
  }
}