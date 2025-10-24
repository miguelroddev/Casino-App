enum GameType{
  BLACK_JACK,
  ROULETTE;

  @override
  String toString(){
    switch (this) {
      case BLACK_JACK:
        return "Black Jack";
      case ROULETTE:
        return "Roulette";
    }
  }
}