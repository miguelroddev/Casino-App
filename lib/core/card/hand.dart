import 'dart:collection';

import 'package:casino_app/core/card/card.dart';
import 'package:casino_app/core/card/ranks.dart';

class Hand {
  final int idPlayer;
  List<Card> _cards = [];
  int _value = 0;
  double _betAmount = 0;

  Hand(this.idPlayer);

  //getters
  List<Card> get cards => _cards;
  int get value => _value;
  double get betAmount => _betAmount;

  void addCard(Card card){
    _cards.add(card);
    _value = calculateHand(_cards);
  }
  
  void addBet(double money){
    if (money<=0){
      //throw invalidMoneyAmountException
    }
    _betAmount += money;
  }

  double payout(int dealerValue,){
    print(betAmount);
    if (_cards.length == 2 && _value ==21 && dealerValue<21){
      print("Chegou aqui! #1");
      return betAmount*(3/2);
    }
    else if((_value > dealerValue && _value <=21) || dealerValue > 21){
      print("Chegou aqui! #2");
      return betAmount;
    }
    else if(_value == dealerValue){
      print("Chegou aqui! #3");
      return 0;
    }
    else{
      print("Chegou aqui! #4");
      return -(betAmount);
    }
  }

  int calculateHand(List<Card> cards){
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