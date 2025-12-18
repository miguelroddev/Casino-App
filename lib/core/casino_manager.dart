import 'package:casino_app/core/casino.dart';
import 'package:casino_app/core/config.dart';
import 'package:casino_app/core/date/date.dart';
import 'package:casino_app/core/player/player.dart';
import 'package:casino_app/core/models/casino_model.dart' as model;
import 'package:casino_app/core/player/player_type.dart';
import 'package:hive/hive.dart';

class CasinoManager{
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

  Player createPlayer(String username, String password){
    return _casino.createPlayer(username, password);
  }

  void increaseSessionID(){
    _casino.increaseSessionID();
  }

  void changeDate(int days){
    _casino.changeDate(days);
  }

  model.PlayerType _convertToModelPlayerType(PlayerType type) {
    switch (type) {
      case PlayerType.NORMAL:
        return model.PlayerType.NORMAL;
      case PlayerType.VIP:
        return model.PlayerType.VIP;
      case PlayerType.BANNED:
        return model.PlayerType.BANNED;
    }
  }

  Future<void> saveCasino({String filename = 'casinobox'}) async {
    final box = await Hive.openBox<model.Casino>(filename);

    final modelCasino = model.Casino(
      _casino.casinoProfit,
      _casino.sessionID,
      _casino.idPlayer,
      model.Date(_casino.date.day),
      _casino.getAllPlayers().asMap().map((i, player) {
        return MapEntry(
          player.idPlayer.toString(),
          model.Player(
            player.idPlayer,
            player.username,
            player.password,
            _convertToModelPlayerType(player.playerType),
            player.bankroll,
            player.sessionMoney,
            player.totalProfit,
            player.totalMoneyBetted,
          ),
        );
      }),
    );

    await box.put('casino', modelCasino);
    await box.flush();
    await box.close();
  }

  static Future<CasinoManager?> loadCasino({String filename = 'casinobox'}) async {
    try {
      final box = await Hive.openBox<model.Casino>(filename);
      final modelCasino = box.get('casino');
      await box.close();

      if (modelCasino == null) {
        if (isConsoleMode) {
          print("No saved casino data found for $filename.hive");
        }
        return null;
      }

      final coreCasino = Casino();
      coreCasino.copyFromModel(modelCasino);

      if (isConsoleMode) {
        print("Casino loaded successfully from $filename.hive");
      }

      return CasinoManager(coreCasino);
    } catch (e) {
      if (isConsoleMode) {
        print("Error loading casino from $filename.hive: $e");
      }
      return null;
    }
  }


}