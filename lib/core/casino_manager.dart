import 'package:casino_app/core/casino.dart';
import 'package:casino_app/core/date/date.dart';
import 'package:casino_app/core/player/player.dart';

class CasinoManager {
  Casino _casino;

  CasinoManager(this._casino);

  Casino get casino => _casino;

  Date getDate(){
    return _casino.date;
  }

  int getCasinoProfit(){
    return _casino.casinoProfit;
  }

  Player getPlayer(int idPlayer){
    return _casino.getPlayer(idPlayer);
  }

  void changeDate(int days){
    _casino.changeDate(days);
  }

}