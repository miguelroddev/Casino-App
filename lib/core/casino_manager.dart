import 'package:casino_app/core/casino.dart';
import 'package:casino_app/core/date/date.dart';

class CasinoManager {
  Casino _casino;

  CasinoManager(this._casino);

  Casino get casino => _casino;

  Date getDate(){
    return _casino.date;
  }
}