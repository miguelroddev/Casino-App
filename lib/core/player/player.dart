
import 'package:casino_app/core/player/player_type.dart';

class Player{
  final int idPlayer;
  final String username;
  final String email;
  final String password;
  PlayerType _playerType = PlayerType.NORMAL;
  int _bankroll = 0;
  int _sessionMoney = 0; // maybe remove this
  int _totalProfit = 0;
  int _totalMoneyBetted = 0;

  Player(this.idPlayer, this.username, this.email, this.password){}

  // getters
  PlayerType get playerType => _playerType;
  int get bankroll => _bankroll;
  int get sessionMoney => _sessionMoney;
  int get totalProfit => _totalProfit;
  int get totalMoneyBetted => _totalMoneyBetted;

  void increaseBankRoll(int money){
    _bankroll += money;
  }

  void endSession(){
    _bankroll += _sessionMoney;
    _sessionMoney = 0;
  }
  void increaseSessionMoneyFromBe
  void addSessionMoney(int money){
    if (money <= 0){
      //throw InvalidMoneyAmountException
    }
    if(_bankroll - money <0){
      // throw NotEnoughMoneyException
    }
    _bankroll -= money;
    _sessionMoney += money;
  }

  void bet(int money){
    if (money<=0){
      //throw InvalidBetAmountException
    }
    if(_sessionMoney - money <0){
      // throw NotEnoughMoneyException
    }
    _sessionMoney -= money;
    _totalMoneyBetted += money;
  }

  @override
  String toString() {
    return "$idPlayer:$username:$email:$_bankroll:$playerType:$_totalProfit";
  }
}