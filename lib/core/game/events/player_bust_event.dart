import 'package:casino_app/core/card/card.dart';
import 'package:casino_app/core/game/events/game_event.dart';
import 'package:casino_app/core/models/casino_model.dart';
import 'package:casino_app/core/utils/console_cards_util.dart';

class PlayerBustEvent extends GameEvent{
  final player;
  bool stand;
  List<Card> cards;

  PlayerBustEvent(super.message, this.player, this.stand, this.cards);

  @override
  String toConsolePrint(){
    if (stand == true){
      return message;
    }
    final lines = <String>[
      message,
    ];

    final cardAscii = ConsoleCardUtils.alignCardsHorizontally(cards);
    lines.addAll(cardAscii);

    return lines.join('\n');
  }
}