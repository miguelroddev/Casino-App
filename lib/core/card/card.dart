import 'package:casino_app/core/card/ranks.dart';
import 'package:casino_app/core/card/suit_type.dart';

class Card{
  final SuitType suit;
  int _value;
  final Rank rank;

  Card(this.suit, this._value, this.rank);

  //getter
  int get value => _value;

  void changeValue(int number){
    _value = value;
  }
}