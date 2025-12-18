class InvalidHandIndexException implements Exception{
  final int handIndex;

  InvalidHandIndexException(this.handIndex);

  @override
  String toString() => "The hand index: $handIndex doesn't exist";
}