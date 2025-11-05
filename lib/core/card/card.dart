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

  List<String> toConsoleLines() {
    final rankStr = rank.toString();
    final suitStr = suit.toPicture();

    return [
      "┌─────────┐",
      "│$rankStr${rankStr.length == 1 ? ' ' : ''}       │",
      "│    $suitStr    │",
      "│       ${rankStr.length == 1 ? ' ' : ''}$rankStr│",
      "└─────────┘",
    ];
  }
}