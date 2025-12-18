import 'package:hive/hive.dart';

part 'casino_model.g.dart';

// 0 - 10 ID for casino_model

@HiveType(typeId: 0)
class Date {
  @HiveField(0)
  int day;

  Date(this.day);
}

@HiveType(typeId: 1)
enum PlayerType{
  @HiveField(0)
  NORMAL,
  @HiveField(1)
  VIP,
  @HiveField(2)
  BANNED;
}

@HiveType(typeId: 2)
class Player{
  @HiveField(0)
  final int idPlayer;
  @HiveField(1)
  final String username;
  @HiveField(2)
  final String password;
  @HiveField(3)
  PlayerType playerType;
  @HiveField(4)
  double bankroll;
  @HiveField(5)
  double sessionMoney;
  @HiveField(6)
  double totalProfit;
  @HiveField(7)
  double totalMoneyBetted;

  Player(this.idPlayer, this.username, this.password,
  this.playerType, this.bankroll, this.sessionMoney, 
  this.totalProfit, this.totalMoneyBetted);
}

@HiveType(typeId: 3)
class Casino {
  @HiveField(0)
  int casinoProfit;
  @HiveField(1)
  int sessionID;
  @HiveField(2)
  int idPlayer;
  @HiveField(3)
  Date date;
  @HiveField(4)
  Map<String, Player> mapPlayers;

  Casino(this.casinoProfit, this.sessionID, this.idPlayer, this.date, this.mapPlayers);

}