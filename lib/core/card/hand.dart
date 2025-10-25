import 'dart:collection';
import 'dart:nativewrappers/_internal/vm/lib/ffi_patch.dart';

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

  int calculateHand(){
    if (_cards.isEmpty){
      //throw NoCardInHandException
    }
    int sum = 0;
    int numAce = 0;
    for (Card card in _cards){
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
}