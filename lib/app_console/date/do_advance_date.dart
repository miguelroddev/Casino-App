import 'package:casino_app/core/casino_manager.dart';
import 'package:casino_app/core/config.dart';
import 'dart:io';

class DoAdvanceDate {
  
  DoAdvanceDate();

  Future<void> execute(CasinoManager casinoManager) async{
    if (isConsoleMode){
      stdout.write("Insert date:");
      String? _input = stdin.readLineSync();
      int? _days = int.tryParse(_input ?? '');
      if (_days == null || _days <= 0){
        //throw InvalidDateException
      }
      casinoManager.changeDate(_days!);
      print("The new date is: ${casinoManager.date.day}");
    }
  }
}