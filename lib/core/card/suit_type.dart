import 'package:casino_app/core/card/card.dart';

enum SuitType{
  HEARTS,
  DIAMONDS,
  CLUBS,
  SPADES;

  String toString(){
    switch (this) {
      case SuitType.HEARTS:
        return "Hearts";
      case SuitType.DIAMONDS:
        return "Diamonds";
      case SuitType.CLUBS:
        return "Clubs";
      case SuitType.SPADES:
        return "Spades";
    }
  }
}