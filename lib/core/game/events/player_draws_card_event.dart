import 'package:casino_app/core/card/card.dart';
import 'package:casino_app/core/game/events/game_event.dart';
import 'package:casino_app/core/player/player.dart';
import 'package:casino_app/core/utils/console_cards_util.dart';

class PlayerDrawsCardEvent extends GameEvent{
  final Player player;
  final List<Card> cards; // why 2 parameters? Because on console mode I gotta print the whole hand everytime...
  final Card card;

  PlayerDrawsCardEvent(super.message, this.player, this.cards, this.card);

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