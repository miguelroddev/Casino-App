import 'package:casino_app/core/card/card.dart';
import 'package:casino_app/core/game/events/game_event.dart';
import 'package:casino_app/core/player/player.dart';

class PlayerHitEvent extends GameEvent{
  final Card card;
  final Player player;

  PlayerHitEvent(super.message, this.card, this.player);

  @override
  String toConsolePrint(){
    return message;
  }
}