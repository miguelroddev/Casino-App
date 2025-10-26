import 'package:casino_app/app/date/do_display_date.dart';
import 'package:casino_app/app/label.dart';
import 'package:casino_app/app/menu/menu.dart';
import 'package:casino_app/app/menu/menu_option.dart';
import 'package:casino_app/core/casino.dart';
import 'package:casino_app/core/casino_manager.dart';

class MainMenu extends Menu{

  


  MainMenu():super(title: Label.TITLE.toString(), 
  options: [new MenuOption(Label.DISPLAY_DATE.toString(), DoDisplayDate().execute),
  
  ]
  );
}