class UsernameDoesntExistException implements Exception {
  final String username;
  UsernameDoesntExistException(this.username);

  @override
  String toString() => 'Username "$username" doesn\'t exist';
}
