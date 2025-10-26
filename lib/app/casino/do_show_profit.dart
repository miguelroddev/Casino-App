import 'package:casino_app/core/casino_manager.dart';
import 'package:casino_app/core/config.dart';

class DoShowProfit {
  
  void execute(CasinoManager casinoManager){
    if(isConsoleMode){
      print("The casino profit is: ${casinoManager.casinoProfit}");
    }
  }
}