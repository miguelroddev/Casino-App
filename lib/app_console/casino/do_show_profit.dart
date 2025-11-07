import 'package:casino_app/core/casino_manager.dart';
import 'package:casino_app/core/config.dart';

class DoShowProfit {
  
  Future<void> execute(CasinoManager casinoManager) async{
    if(isConsoleMode){
      print("The casino profit is: ${casinoManager.casinoProfit}");
    }
  }
}