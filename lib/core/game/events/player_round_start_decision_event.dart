import 'dart:async';

import 'package:casino_app/core/game/events/game_event.dart';
import 'package:casino_app/core/player/player.dart';

class PlayerRoundStartDecisionEvent extends GameEvent{
  final Player player;
  final Completer<String> completer = Completer<String>();

  
  PlayerRoundStartDecisionEvent(super.message, this.player);

  @override
  String toConsolePrint(){
    return message;
  }
}