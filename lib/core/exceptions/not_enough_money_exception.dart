class NotEnoughMoneyException implements Exception{
  NotEnoughMoneyException();

  @override
  String toString() => "You don't have enough money for this action";
}