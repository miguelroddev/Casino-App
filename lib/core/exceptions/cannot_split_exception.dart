class CannotSplitException implements Exception{
  CannotSplitException();

  @override
  String toString() => "This hand can't be split";
}