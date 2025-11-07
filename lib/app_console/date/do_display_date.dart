import 'package:casino_app/core/casino_manager.dart';
import 'package:casino_app/core/config.dart';

class DoDisplayDate {

  DoDisplayDate();

  Future<void> execute(CasinoManager casinoManager) async{
    if (isConsoleMode){
      print("The current date is: ${casinoManager.date.day}");
    }
  }

}