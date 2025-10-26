import 'package:casino_app/core/casino_manager.dart';

typedef MenuAction = void Function(CasinoManager receiver);

class MenuOption {
  final String label;
  final MenuAction action;

  MenuOption(this.label, this.action);
}