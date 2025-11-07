import 'package:casino_app/core/game/events/game_event.dart';

class SucessfulBetEvent extends GameEvent{

  SucessfulBetEvent(super.message);

  @override
  String toConsolePrint(){
    return message;
  }
}