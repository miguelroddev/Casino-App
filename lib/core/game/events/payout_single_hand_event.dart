import 'package:casino_app/core/game/events/game_event.dart';
import 'package:casino_app/core/player/player.dart';

class PayoutSingleHandEvent extends GameEvent{
  final Player player;
  final double payout;
  final int handIndex;

  PayoutSingleHandEvent(super.message, this.player, this.payout, this.handIndex);

  @override
  String toConsolePrint(){
    if(message == ""){ //It means I don't want the console to show anything
      return "";
    }
    return message;
  }
}