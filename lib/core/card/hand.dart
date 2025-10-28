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

}