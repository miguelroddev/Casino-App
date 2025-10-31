import 'package:casino_app/core/card/card.dart';
import 'package:casino_app/core/game/game_type.dart';

class Deck {
  List<Card> _cardsAtuais;
  List<Card> _cardsUsadas = [];
  final GameType gameType;
  
  Deck(this.gameType, this._cardsAtuais){}

  //getters
  List<Card> get cardsAtuais => _cardsAtuais;
  List<Card> get cardsUsadas => _cardsUsadas;
  int get remainingCards => _cardsAtuais.length;

  Card takeCard() {
    Card temp = _cardsAtuais.last;
    _cardsUsadas.add(temp);
    _cardsAtuais.removeLast();
    return temp;
  }

  void resetDeck(){
    for (Card card in _cardsUsadas){
      _cardsAtuais.add(card);
    }
    _cardsUsadas = [];
    _cardsAtuais.shuffle();
  }
} 