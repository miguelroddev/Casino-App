import 'package:casino_app/core/card/card.dart';
import 'package:casino_app/core/game/events/game_event.dart';
import 'package:casino_app/core/player/player.dart';
import 'package:casino_app/core/utils/console_cards_util.dart';

class PlayerSplitEvent extends GameEvent{
  final Player player;
  final List<List<Card>> hands;

  PlayerSplitEvent(super.message, this.player, this.hands);

  @override
  String toConsolePrint(){
    final lines = <String>[
      "\n$message",
    ];

    for (int i = 0; i < hands.length; i++) {
      final hand = hands[i];
      lines.add("Hand number ${i + 1}:");

      final cardAscii = ConsoleCardUtils.alignCardsHorizontally(hand);
      lines.addAll(cardAscii);
    }

    return lines.join('\n');
  }
}