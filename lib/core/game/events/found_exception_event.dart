import 'package:casino_app/core/game/events/game_event.dart';

class FoundExceptionEvent extends GameEvent{

  FoundExceptionEvent(super.message);

  @override
  String toConsolePrint(){
    return message;
  }
}