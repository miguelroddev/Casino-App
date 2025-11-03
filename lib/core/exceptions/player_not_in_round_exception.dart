class PlayerNotInRoundException implements Exception{
  final int idPlayer;


  PlayerNotInRoundException(this.idPlayer){}

  @override
  String toString() => "The player id: $idPlayer not in the round";
}