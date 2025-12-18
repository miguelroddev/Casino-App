class NotAceException implements Exception{
  NotAceException();

  @override
  String toString() => "The card inserted is not an Ace";
}