class NoSuchPlayerException implements Exception{
  final int idPlayer;


  NoSuchPlayerException(this.idPlayer){}

  @override
  String toString() => "The player id: $idPlayer doesn't exist";
}