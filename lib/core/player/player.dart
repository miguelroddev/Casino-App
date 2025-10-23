
import 'package:casino_app/core/player/player_type.dart';

class Player{
  late int _idPlayer;
  late String _username;
  late String _email;
  late String _password;
  PlayerType _playerType = PlayerType.NORMAL;
  int _bankroll = 0;
  int _sessionMoney = 0; // maybe remove this
  int _totalProfit = 0;
  int _totalMoneyBetted = 0;

  Player(int id_player, String username, String email, String password){
    _idPlayer = id_player;
    _username = username;
    _email = email;
    _password = password;
  }

  @override
  String toString() {
    return "$_idPlayer:$_username:$_email:$_bankroll:$_playerType:$_totalProfit";
  }
}