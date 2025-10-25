import 'dart:collection';
import 'dart:nativewrappers/_internal/vm/lib/ffi_patch.dart';

import 'package:casino_app/core/card/card.dart';

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