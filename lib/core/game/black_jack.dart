import 'package:casino_app/core/game/game_type.dart';
import 'package:casino_app/core/round/round.dart';

class BlackJack {

  BlackJack(GameType gameType, Round round) : super(gameType, round);

  // List<Card> _generateBlackjackDeck() {
  //   final List<Card> deck = [];
  //   final List<String> ranks = Rank.values [
  //     'A', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K'
  //   ];

  //   for (final suit in SuitType.values) {
  //     for (final rank in ranks) {
  //       final int value = _getCardValue(rank);
  //       deck.add(Card(suit, rank, value));
  //     }
  //   }

  //   return deck;
  // }
}