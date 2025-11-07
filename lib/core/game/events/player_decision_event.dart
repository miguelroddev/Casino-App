import 'dart:async';
import 'package:casino_app/core/card/card.dart';
import 'package:casino_app/core/game/events/game_event.dart';
import 'package:casino_app/core/player/player.dart';
import 'package:casino_app/core/utils/console_cards_util.dart';

class PlayerDecisionEvent extends GameEvent {
  final Player player;
  final Completer<String> completer = Completer<String>();
  final List<Card> cards;

  PlayerDecisionEvent(super.message, this.player, this.cards);

  @override
  String toConsolePrint() {
    final lines = <String>[
      "\n$message",
    ];

    final cardAscii = ConsoleCardUtils.alignCardsHorizontally(cards);
    lines.addAll(cardAscii);
    lines.add("Options for ${player.username}: (H)it, (S)tand, (D)ouble, (P)Split");

    return lines.join('\n');
  }
}