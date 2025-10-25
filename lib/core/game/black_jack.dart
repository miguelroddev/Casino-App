import 'package:casino_app/core/card/card.dart';
import 'package:casino_app/core/card/ranks.dart';
import 'package:casino_app/core/card/suit_type.dart';
import 'package:casino_app/core/game/game.dart';
import 'package:casino_app/core/game/game_type.dart';
import 'package:casino_app/core/round/round.dart';

class BlackJack extends Game{

  BlackJack(GameType gameType, Round round) : super(gameType, round);

  void endGame(){}
  void checkGameEnd(){}
  void startRound(){}

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

  List<Card> _generateBlackjackDeck() {
    final List<Card> deck = [];
    final List<String> ranks = Rank.values;

    for (final suit in SuitType.values) {
      for (final rank in ranks) {
        final int value = _getCardValue(rank);
        deck.add(Card(suit, rank, value));
      }
    }

    return deck;
  }
}