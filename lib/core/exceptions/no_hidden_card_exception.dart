class NoHiddenCardException implements Exception {
  NoHiddenCardException();

  @override
  String toString() => "The dealer has no hidden card!";
}