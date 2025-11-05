import 'package:casino_app/app_console/casino/do_show_profit.dart';
import 'package:casino_app/app_console/casino/label.dart';
import 'package:casino_app/app_console/menu/menu.dart';
import 'package:casino_app/app_console/menu/menu_option.dart';

class CasinoMenu extends Menu{
  
  CasinoMenu():super(title: Label.TITLE.toString(), 
  options: [new MenuOption(Label.SHOW_PROFIT.toString(), DoShowProfit().execute),
            //s
  ]
  );
}