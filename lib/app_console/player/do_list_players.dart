import 'package:casino_app/core/casino_manager.dart';
import 'package:casino_app/core/player/player.dart';

class DoListPlayers {
  Future<void> execute(CasinoManager casinoManager) async{
    List<Player> _players = casinoManager.getAllPlayers();
    for (Player player in _players){
      print(player.toString());
    }

  }
}