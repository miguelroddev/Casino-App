import 'package:casino_app/core/casino.dart';
import 'package:casino_app/core/date/date.dart';
import 'package:casino_app/core/player/player.dart';

class CasinoManager {
  Casino _casino;

  CasinoManager(this._casino);

  //getters
  Casino get casino => _casino;
  Date get date => _casino.date;
  int get sessionID => _casino.sessionID;
  int get casinoProfit => _casino.casinoProfit;


  Player getPlayer(int idPlayer){
    return _casino.getPlayer(idPlayer);
  }

  List<Player> getAllPlayers(){
    return _casino.getAllPlayers();
  }

  Player createPlayer(String username, String email, String password){
    return _casino.createPlayer(username, email, password);
  }

  void increaseSessionID(){
    _casino.increaseSessionID();
  }

  void changeDate(int days){
    _casino.changeDate(days);
  }

}