class NoCardInHandException implements Exception{
  NoCardInHandException();

  @override
  String toString() => "There are no cards inside the Hand!";
}