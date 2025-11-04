import 'dart:collection';

import 'package:casino_app/core/date/date.dart';
import 'package:casino_app/core/exceptions/no_such_player_exception.dart';
import 'package:casino_app/core/player/player.dart';
import 'package:casino_app/core/models/casino_model.dart' as model;
import 'package:casino_app/core/player/player_type.dart';

class Casino {
  int _casinoProfit = 0;
  int _sessionID = 0;
  int _idPlayer = 1;
  Date _date = new Date(1);
  Map<String, Player> _mapPlayers = new HashMap();

  Casino();

  //getter
  Date get date => _date;
  int get sessionID => _sessionID;
  int get casinoProfit => _casinoProfit;
  int get idPlayer => _idPlayer;
  List<Player> getAllPlayers() => _mapPlayers.values.toList();

  Player getPlayer(int idPlayer){
    if (_mapPlayers[idPlayer.toString()] == null){
      throw NoSuchPlayerException(idPlayer);
    }
    return _mapPlayers[idPlayer.toString()]!;
  }

  Player createPlayer(String username, String email, String password){
    //maybe add logic to check wheter username or email already exists? and throw exception
    Player player = Player(_idPlayer, username, email, password);
    _mapPlayers[_idPlayer.toString()] = player;
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

  // logic to load casino data:

  PlayerType _convertFromModelPlayerType(model.PlayerType type) {
    switch (type) {
      case model.PlayerType.NORMAL:
        return PlayerType.NORMAL;
      case model.PlayerType.VIP:
        return PlayerType.VIP;
      case model.PlayerType.BANNED:
        return PlayerType.BANNED;
    }
  }

  void copyFromModel(model.Casino m) {
    _casinoProfit = m.casinoProfit;
    _sessionID = m.sessionID;
    _idPlayer = m.idPlayer;
    _date = Date(m.date.day);

    _mapPlayers.clear();
    m.mapPlayers.forEach((key, modelPlayer) {
      final player = Player(
        modelPlayer.idPlayer,
        modelPlayer.username,
        modelPlayer.email,
        modelPlayer.password,
      );

      player.setSessionMoney(modelPlayer.sessionMoney);
      player.setBankRoll(modelPlayer.bankroll);
      player.setTotalProfit(modelPlayer.totalProfit);
      player.setTotalMoneyBetted(modelPlayer.totalMoneyBetted);
      player.setPlayerType(_convertFromModelPlayerType(modelPlayer.playerType));

      _mapPlayers[key] = player;
    });
  }

}