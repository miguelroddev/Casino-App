import 'package:casino_app/core/game/events/game_event.dart';
import 'package:casino_app/core/player/player.dart';

class PlayerBlackjackEvent extends GameEvent{
  final Player player;
  final double payout;

  PlayerBlackjackEvent(super.message, this.player, this.payout);

  @override
  String toConsolePrint(){
    return "BLACKJACK for ${player.username}! Instant payout of $payout";
  }
}