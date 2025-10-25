enum Rank {
  ACE,
  TWO,
  THREE,
  FOUR,
  FIVE,
  SIX,
  SEVEN,
  EIGHT,
  NINE,
  TEN,
  JACK,
  QUEEN,
  KING;

  @override
  String toString() {
    switch (this) {
      case Rank.ACE:
        return "A";
      case Rank.TWO:
        return "2";
      case Rank.THREE:
        return "3";
      case Rank.FOUR:
        return "4";
      case Rank.FIVE:
        return "5";
      case Rank.SIX:
        return "6";
      case Rank.SEVEN:
        return "7";
      case Rank.EIGHT:
        return "8";
      case Rank.NINE:
        return "9";
      case Rank.TEN:
        return "10";
      case Rank.JACK:
        return "J";
      case Rank.QUEEN:
        return "Q";
      case Rank.KING:
        return "K";
    }
  }
}
