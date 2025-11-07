import 'dart:async';
import 'package:casino_app/core/game/events/game_event.dart';
import 'package:casino_app/core/player/player.dart';

class HandleBetEvent extends GameEvent{
  final Player player;
  Completer<String> completer = Completer<String>();

  HandleBetEvent(super.message, this.player);

  @override
  String toConsolePrint(){
    return message;
  }
}