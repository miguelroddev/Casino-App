import 'package:casino_app/core/game/events/game_event.dart';
import 'package:casino_app/core/player/player.dart';

class PlayerPayoutEvent extends GameEvent{
  final Player player;
  final double payout;

  PlayerPayoutEvent(super.message, this.player, this.payout);

  @override
  String toConsolePrint(){
    return message;
  }
}