
import 'package:casino_app/core/player/player_type.dart';

class Player{
  final int idPlayer;
  final String username;
  final String email;
  final String password;
  PlayerType _playerType = PlayerType.NORMAL;
  double _bankroll = 0;
  double _sessionMoney = 0; // maybe remove this
  double _totalProfit = 0;
  double _totalMoneyBetted = 0;

  Player(this.idPlayer, this.username, this.email, this.password){}

  // getters
  PlayerType get playerType => _playerType;
  double get bankroll => _bankroll;
  double get sessionMoney => _sessionMoney;
  double get totalProfit => _totalProfit;
  double get totalMoneyBetted => _totalMoneyBetted;

  void increaseBankRoll(double money){
    _bankroll += money;
  }

  void clearBet(){
    _sessionMoney += _totalMoneyBetted;
    _totalMoneyBetted = 0;
  }

  void addBet(double money){
    if (money<= 0){
      //throw InvalidMoneyAmountException
    }
    if (_sessionMoney - money <0){
      // throw NotEnoughMoneyException
    }
    _sessionMoney -= money;
    _totalMoneyBetted += money;
  }

  void finishSession(){
    clearBet();
    _bankroll += _sessionMoney;
    _sessionMoney = 0;
  }

  void clearTotalMoneyBetter(){
    _totalMoneyBetted;
  }

  void finishRoundNormalWin(){}

  void addSessionMoney(double money){
    if (money <= 0){
      //throw InvalidMoneyAmountException
    }
    if(_bankroll - money <0){
      // throw NotEnoughMoneyException
    }
    _bankroll -= money;
    _sessionMoney += money;
  }

  void addTotalProfit(double money){
    _totalProfit += money;
  }

  void bet(double money){
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