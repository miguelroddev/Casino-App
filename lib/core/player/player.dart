
import 'package:casino_app/core/player/player_type.dart';

class Player{
  late int _id_player;
  late String _username;
  late String _email;
  late String _password;
  PlayerType _player_type = PlayerType.NORMAL;
  int _bankroll = 0;
  int _session_money = 0; // maybe remove this
  int _total_profit = 0;
  int _total_money_betted = 0;

  Player(int id_player, String username, String email, String password){
    _id_player = id_player;
    _username = username;
    _email = email;
    _password = password;
  }

  @override
  String toString() {
    return "$_id_player:$_username:$_email:$_bankroll:$_player_type:$_total_profit";
  }
}