class InvalidHandIndexException {
  final int handIndex;

  InvalidHandIndexException(this.handIndex);

  @override
  String toString() => "The hand index: $handIndex doesn't exist";
}