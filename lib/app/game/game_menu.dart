import 'package:casino_app/app/game/do_play_black_jack.dart';
import 'package:casino_app/app/game/do_play_roulette.dart';
import 'package:casino_app/app/game/label.dart';
import 'package:casino_app/app/menu/menu.dart';
import 'package:casino_app/app/menu/menu_option.dart';

class GameMenu extends Menu{

  GameMenu():super(title: Label.TITLE.toString(), 
  options: [new MenuOption(Label.PLAY_BLACK_JACK.toString(), DoPlayBlackJack().execute),
            new MenuOption(Label.PLAY_ROULETTE.toString(), DoPlayRoulette().execute),
  ]
  );
}