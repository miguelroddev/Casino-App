import 'package:casino_app/app_console/menu/menu.dart';
import 'package:casino_app/app_console/menu/menu_option.dart';
import 'package:casino_app/app_console/player/do_add_bankroll.dart';
import 'package:casino_app/app_console/player/do_create_player.dart';
import 'package:casino_app/app_console/player/do_debug_show_all_atributes.dart';
import 'package:casino_app/app_console/player/do_list_players.dart';
import 'package:casino_app/app_console/player/do_show_player.dart';
import 'package:casino_app/app_console/player/label.dart';

class PlayerMenu extends Menu{

  PlayerMenu():super(title: Label.TITLE.toString(), 
  options: [new MenuOption(Label.LIST_PLAYERS.toString(), DoListPlayers().execute),
            new MenuOption(Label.SHOW_PLAYER.toString(), DoShowPlayer().execute),
            new MenuOption(Label.CREATE_PLAYER.toString(), DoCreatePlayer().execute),
            new MenuOption(Label.ADD_BANKROLL.toString(), DoAddBankroll().execute),
            new MenuOption(Label.DEBUG_SHOW_ATRIBUTES.toString(), DoDebugShowAllAtributes().execute)          //s
  ]
  );
}