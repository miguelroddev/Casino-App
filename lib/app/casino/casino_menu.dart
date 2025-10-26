import 'package:casino_app/app/casino/do_show_profit.dart';
import 'package:casino_app/app/casino/label.dart';
import 'package:casino_app/app/menu/menu.dart';
import 'package:casino_app/app/menu/menu_option.dart';

class CasinoMenu extends Menu{
  
  CasinoMenu():super(title: Label.TITLE.toString(), 
  options: [new MenuOption(Label.SHOW_PROFIT.toString(), DoShowProfit().execute),
            //s
  ]
  );
}