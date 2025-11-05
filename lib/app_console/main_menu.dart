import 'package:casino_app/app_console/casino/casino_menu.dart';
import 'package:casino_app/app_console/date/do_advance_date.dart';
import 'package:casino_app/app_console/date/do_display_date.dart';
import 'package:casino_app/app_console/game/game_menu.dart';
import 'package:casino_app/app_console/label.dart';
import 'package:casino_app/app_console/menu/menu.dart';
import 'package:casino_app/app_console/menu/menu_option.dart';
import 'package:casino_app/app_console/player/player_menu.dart';
import 'package:casino_app/core/casino.dart';
import 'package:casino_app/core/casino_manager.dart';

class MainMenu extends Menu{

  MainMenu():super(title: Label.TITLE.toString(), 
  options: [new MenuOption(Label.DISPLAY_DATE.toString(), DoDisplayDate().execute),
            new MenuOption(Label.ADVANCE_DATE.toString(), DoAdvanceDate().execute),
            new MenuOption.submenu(Label.OPEN_MENU_PLAYERS.toString(), PlayerMenu()),
            new MenuOption.submenu(Label.OPEN_MENU_CASINO.toString(), CasinoMenu()),
            new MenuOption.submenu(Label.OPEN_MENU_GAMES.toString(), GameMenu()),
  
  ]
  );
}