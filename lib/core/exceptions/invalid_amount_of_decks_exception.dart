class InvalidAmountOfDecksException implements Exception{
  final int decks;

  InvalidAmountOfDecksException(this.decks);

  @override
  String toString() => "The amount of decks inserted: $decks is invalid";
}