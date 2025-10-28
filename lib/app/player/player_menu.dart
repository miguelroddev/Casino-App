import 'package:casino_app/app/menu/menu.dart';
import 'package:casino_app/app/menu/menu_option.dart';
import 'package:casino_app/app/player/do_create_player.dart';
import 'package:casino_app/app/player/do_list_players.dart';
import 'package:casino_app/app/player/do_show_player.dart';
import 'package:casino_app/app/player/label.dart';

class PlayerMenu extends Menu{

  PlayerMenu():super(title: Label.TITLE.toString(), 
  options: [new MenuOption(Label.LIST_PLAYERS.toString(), DoListPlayers().execute),
            new MenuOption(Label.SHOW_PLAYER.toString(), DoShowPlayer().execute),
            new MenuOption(Label.CREATE_PLAYER.toString(), DoCreatePlayer().execute)            //s
  ]
  );
}