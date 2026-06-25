class DateDoesntExistException implements Exception{
  final int day;

  DateDoesntExistException(this.day);

  @override
  String toString() => "The day inserted: '$day' doesn't exist";
}