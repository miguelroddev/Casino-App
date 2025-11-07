import 'package:casino_app/app_console/menu/menu.dart';
import 'package:casino_app/core/casino_manager.dart';

typedef MenuAction = Future<void> Function(CasinoManager receiver);

class MenuOption {
  final String label;
  final MenuAction action;

  //1st constructor to run a method directly
  MenuOption(this.label, this.action);

  //2nd constructor to open a submenu
  MenuOption.submenu(this.label, Menu submenu)
    : action = ((manager) => submenu.start(manager));
}