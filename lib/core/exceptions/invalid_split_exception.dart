class InvalidSplitException implements Exception{
  InvalidSplitException();

  @override
  String toString()=> "This hand cannot be split!";
}