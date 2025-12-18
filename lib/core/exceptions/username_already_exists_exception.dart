class UsernameAlreadyExistsException implements Exception {
  final String username;
  UsernameAlreadyExistsException(this.username);

  @override
  String toString() => 'Username "$username" already exists';
}
