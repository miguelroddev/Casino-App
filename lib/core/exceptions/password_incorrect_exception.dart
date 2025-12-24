class PasswordIncorrectException implements Exception {
  PasswordIncorrectException();

  @override
  String toString() => 'Password is incorrect';
}
