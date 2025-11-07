import 'package:casino_app/core/game/events/game_event.dart';

class InvalidOptionEvent extends GameEvent{
  final player;

  InvalidOptionEvent(super.message, this.player);

  @override
  String toConsolePrint(){
    return message;
  }
}