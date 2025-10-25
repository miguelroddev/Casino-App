import 'package:casino_app/core/card/card.dart';
import 'package:casino_app/core/game/game_type.dart';

class Deck {
  final int numDecks;
  List<Card> cards = [];
  
  Deck(this.numDecks, GameType gameType){
    generateDeck(numDecks, gameType);
  }

}