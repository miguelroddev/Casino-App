abstract class GameEvent {
  final String message;

  GameEvent(this.message);

  String toConsolePrint();
}