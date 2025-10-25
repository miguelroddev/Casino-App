import 'package:casino_app/core/card/card.dart';
import 'package:casino_app/core/card/deck.dart';
import 'package:casino_app/core/card/hand.dart';
import 'package:casino_app/core/card/ranks.dart';
import 'package:casino_app/core/card/suit_type.dart';
import 'package:casino_app/core/game/game.dart';
import 'package:casino_app/core/game/game_type.dart';
import 'package:casino_app/core/round/bj21_round.dart';

class BlackJack extends Game{
  late Deck _deck;

  BlackJack(BlackJackRound round, int numDecks) : super(GameType.BLACK_JACK, round){
    _deck = generateBlackjackDeck(numDecks);
  }

  //getter
  Deck get deck => _deck;

  void endGame(){}
  void checkGameEnd(){}
  void startRound(){
    
  }

  int getValue(Rank rank){
    switch (rank) {
      case Rank.ACE:
        return 11; // future logic check can alter this value
      case Rank.TWO:
        return 2;
      case Rank.THREE:
        return 3;
      case Rank.FOUR:
        return 4;
      case Rank.FIVE:
        return 5;
      case Rank.SIX:
        return 6;
      case Rank.SEVEN:
        return 7;
      case Rank.EIGHT:
        return 8;
      case Rank.NINE:
        return 9;
      case Rank.TEN:
        return 10;
      case Rank.JACK:
        return 10;
      case Rank.QUEEN:
        return 10;
      case Rank.KING:
        return 10;
    }
  }

  Deck generateBlackjackDeck(int numDecks) {
    if (numDecks <= 0 || numDecks > 8){
      //throw InvalidAmountDecksException 
    }
    
    List<Card> deck = [];
    List<Rank> ranks = Rank.values;

    for (int i=0; i<numDecks; i++) {
      for (SuitType suit in SuitType.values) {
        for (Rank rank in ranks) {
          int value = getValue(rank);
          deck.add(Card(suit, value, rank));
        }
      }
    }
    deck.shuffle();
    return new Deck(GameType.BLACK_JACK, deck);
  }

  Deck shuffle(Deck deck){
    deck.cardsAtuais.shuffle();
    return deck;
  }

  int calculateHand(Hand hand){
    List<Card> cards = hand.cards;
    if (cards.isEmpty){
      //throw NoCardInHandException
    }
    int sum = 0;
    int numAce = 0;
    for (Card card in cards){
      if(card.rank == Rank.ACE){
        numAce += 1;
      }else{
        sum += card.value;
      }
    }
    if(numAce>0){
      if (sum +11 + numAce -1 <= 21){ //there can never be 2 Aces with the value of 11
        return sum +11 + numAce -1;
      }
      else{
        return sum + numAce;
      }
    }
    return sum;
  }

  Card changeAceValue(Card ace){ // useless method? maybe.
    if (ace.rank != Rank.ACE){
      //throw NotAceException
    }
    if (ace.value == 11){
      ace.changeValue(1);
      return ace;
    }else{
      ace.changeValue(11);
      return ace;
    }
  }
}