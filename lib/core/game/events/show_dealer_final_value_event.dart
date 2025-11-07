import 'package:casino_app/core/game/events/game_event.dart';

class ShowDealerFinalValueEvent extends GameEvent{
  final int value;

  ShowDealerFinalValueEvent(super.message, this.value);

  @override
  String toConsolePrint(){
    if (value > 21){
      return "Dealer Busted!!\n$message";
    }
    return message;
  }
}