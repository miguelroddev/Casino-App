class InvalidDateException implements Exception{
  final int day;

  InvalidDateException(this.day);

  @override
  String toString() => "The day inserted: '$day' is invalid";
}