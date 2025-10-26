import 'package:casino_app/core/casino_manager.dart';
import 'package:casino_app/core/config.dart';

class DoDisplayDate {

  DoDisplayDate();

  void execute(CasinoManager casinoManager){
    if (isConsoleMode){
      print("The current date is: ${casinoManager.getDate().day}");
    }
  }

}