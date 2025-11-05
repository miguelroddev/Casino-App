import 'package:casino_app/core/card/card.dart';
import 'package:casino_app/core/game/events/game_event.dart';
import 'package:casino_app/core/utils/console_cards_util.dart';

class DealerDrawsCardEvent extends GameEvent{
  
  final List<Card> cards; // why 2 parameters? Because on console mode I gotta print the whole hand everytime...
  final Card? card;
  final Card? hiddenCard;

  DealerDrawsCardEvent(super.message, this.cards, this.card, this.hiddenCard);

  @override
  String toConsolePrint(){
    final lines = <String>[
      "\n$message",
    ];
    
    final cardAscii = ConsoleCardUtils.alignCardsHorizontally(cards);
    lines.addAll(cardAscii);
    var temp = lines.join('\n');
    if (hiddenCard != null){
      temp +("\nHIDDEN CARD");
    }
    return temp;
  }

}