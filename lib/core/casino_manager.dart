import 'package:casino_app/core/casino.dart';

class CasinoManager {
  Casino _casino;

  CasinoManager(this._casino);

  Casino get casino => _casino;
}