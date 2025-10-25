import 'package:casino_app/core/card/ranks.dart';
import 'package:casino_app/core/card/suit_type.dart';

class Card{
  final SuitType suit;
  int _number;
  final Rank rank;

  Card(this.suit, this._number, this.rank);

  //getter
  int get number => _number;
}