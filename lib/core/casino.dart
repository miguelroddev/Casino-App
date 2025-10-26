import 'dart:collection';

import 'package:casino_app/core/exceptions/no_such_player_exception.dart';
import 'package:casino_app/core/player/player.dart';

class Casino {
  Map<int, Player> mapPlayers = new HashMap();


  Player getPlayer(int idPlayer){
    if (mapPlayers[idPlayer] == null){
      throw NoSuchPlayerException(idPlayer);
    }
    return mapPlayers[idPlayer]!;
  }
}