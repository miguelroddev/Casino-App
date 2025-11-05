enum Label {
  TITLE,
  PLAY_BLACK_JACK,
  PLAY_ROULETTE;

  @override
  String toString(){
    switch (this){
      case Label.TITLE: return "Game Menu";
      case Label.PLAY_BLACK_JACK: return "Play BlackJack";
      case Label.PLAY_ROULETTE: return "Play Roulette";
    }
  }
}