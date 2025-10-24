import 'package:casino_app/core/game/game.dart';

class Session {
  final int idSession;
  Game _game;

  Session(this.idSession, this._game){}

  //getters
  Game get game => _game;
}