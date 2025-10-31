import 'dart:collection';

import 'package:casino_app/core/card/card.dart';
import 'package:casino_app/core/card/ranks.dart';

class Hand {
  final int idPlayer;
  List<Card> _cards = [];

  Hand(this.idPlayer);

  //getters
  List<Card> get cards => _cards;

  void addCard(Card card){
    _cards.add(card);
  }

  void printHand() {
    if (_cards.isEmpty) {
      //throw IsEmptyException
    }

    final cardLines = _cards.map((card) {
      final rankStr = card.rank.toString();  
      final suitStr = card.suit.toPicture();

      return [
        "┌─────────┐",
        "│$rankStr${rankStr.length == 1 ? ' ' : ''}       │",
        "│    $suitStr    │",
        "│       ${rankStr.length == 1 ? ' ' : ''}$rankStr│",
        "└─────────┘",
      ];
    }).toList();

    for (int i = 0; i < cardLines[0].length; i++) {
      print(cardLines.map((lines) => lines[i]).join(" "));
    }
  }

}