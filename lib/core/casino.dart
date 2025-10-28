import 'dart:collection';

import 'package:casino_app/core/date/date.dart';
import 'package:casino_app/core/exceptions/no_such_player_exception.dart';
import 'package:casino_app/core/player/player.dart';

class Casino {
  int _casinoProfit = 0;
  int _sessionID = 0;
  int _idPlayer = 1;
  Date _date = new Date(1);
  Map<int, Player> _mapPlayers = new HashMap();

  Casino();

  //getter
  Date get date => _date;
  int get sessionID => _sessionID;
  int get casinoProfit => _casinoProfit;
  int get idPlayer => _idPlayer;
  List<Player> getAllPlayers() => _mapPlayers.values.toList();

  Player getPlayer(int idPlayer){
    if (_mapPlayers[idPlayer] == null){
      throw NoSuchPlayerException(idPlayer);
    }
    return _mapPlayers[idPlayer]!;
  }

  Player createPlayer(String username, String email, String password){
    //maybe add logic to check wheter username or email already exists? and throw exception
    Player player = Player(_idPlayer, username, email, password);
    _mapPlayers[_idPlayer] = player;
    _idPlayer +=1;
    return player;
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