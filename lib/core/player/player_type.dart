enum PlayerType{
  NORMAL,
  VIP,
  BANNED;

  String toString(){
    switch (this) {
      case PlayerType.NORMAL:
        return "Normal";
      case PlayerType.VIP:
        return "VIP";
      case PlayerType.BANNED:
        return "Banned";
    }
  }
}