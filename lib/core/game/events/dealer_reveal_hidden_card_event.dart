import 'package:casino_app/core/card/card.dart';
import 'package:casino_app/core/game/events/game_event.dart';
import 'package:casino_app/core/utils/console_cards_util.dart';

class DealerRevealHiddenCardEvent extends GameEvent{
  Card hiddenCard;
  List<Card> cards;

  DealerRevealHiddenCardEvent(super.message, this.hiddenCard, this.cards);

  @override
  String toConsolePrint(){
    final lines = <String>[];

    final cardAscii = ConsoleCardUtils.alignCardsHorizontally(cards);
    lines.addAll(cardAscii);

    return lines.join('\n');
  }
}