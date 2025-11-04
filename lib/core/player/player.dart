
import 'package:casino_app/core/exceptions/invalid_money_amount_exception.dart';
import 'package:casino_app/core/exceptions/not_enough_money_exception.dart';
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
  double _totalMoneyBetted = 0; // only serves to keep track of the initial better amount

  Player(this.idPlayer, this.username, this.email, this.password){}

  // getters
  PlayerType get playerType => _playerType;
  double get bankroll => _bankroll;
  double get sessionMoney => _sessionMoney;
  double get totalProfit => _totalProfit;
  double get totalMoneyBetted => _totalMoneyBetted;

  void increaseBankRoll(double money){
    if (money <= 0){
      throw InvalidMoneyAmountException(money);
    }
    _bankroll += money;
  }

  void confirmBetToHand(){
    
  }

  void clearBet(){
    _sessionMoney += _totalMoneyBetted;
    _totalMoneyBetted = 0;
  }

  void finishSession(){
    clearBet();
    _bankroll += _sessionMoney;
    _sessionMoney = 0;
  }

  void clearTotalMoneyBetted(){
    _totalMoneyBetted = 0;
  }

  void finishRoundNormalWin(){}

  void addSessionMoney(double money){
    if (money <= 0){
      throw InvalidMoneyAmountException(money);
    }
    if(_bankroll - money <0){
      throw NotEnoughMoneyException();
    }
    _bankroll -= money;
    _sessionMoney += money;
  }

  void payoutUpdate(double money){
    _sessionMoney += money;
    _totalProfit += money;
    clearTotalMoneyBetted(); //it's here and not at the beggining because of the case there is a split
  }

  void addTotalProfit(double money){
    _totalProfit += money;
  }

  void bet(double money){
    if (money<=0){
      throw InvalidMoneyAmountException(money);
    }
    if(_sessionMoney - money <0){
      throw NotEnoughMoneyException();
    }
    _sessionMoney -= money;
    _totalProfit -= money;
    _totalMoneyBetted += money;
  }

  void setTotalMoneyBetted(double money){
    _totalMoneyBetted = money;
  }

  void setTotalProfit(double money){
    _totalProfit = money;
  }

  void setBankRoll(double money){
    _bankroll = money;
  }

  void setSessionMoney(double money){
    _sessionMoney = money;
  }
  
  void setPlayerType(PlayerType playerType){
    _playerType = playerType;
  }

  @override
  String toString() {
    return "$idPlayer:$username:$email:$_bankroll:$playerType:$_totalProfit";
  }
}