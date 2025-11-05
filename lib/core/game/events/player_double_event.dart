import 'package:casino_app/core/card/card.dart';
import 'package:casino_app/core/game/events/game_event.dart';
import 'package:casino_app/core/player/player.dart';
import 'package:casino_app/core/utils/console_cards_util.dart';

class PlayerDoubleEvent extends GameEvent{
  final Card card;
  final Player player;
  final List<Card> cards;

  PlayerDoubleEvent(super.message, this.card, this.player, this.cards);

  @override
  String toConsolePrint(){
    final lines = <String>[
      "\n$message",
    ];

    final cardAscii = ConsoleCardUtils.alignCardsHorizontally(cards);
    lines.addAll(cardAscii);

    return lines.join('\n');
  }
}