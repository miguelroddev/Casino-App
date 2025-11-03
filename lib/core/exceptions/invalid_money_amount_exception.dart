class InvalidMoneyAmountException {
  final double money;

  InvalidMoneyAmountException(this.money);

  @override
  String toString() => "The amount inserted: '$money' is invalid";
}