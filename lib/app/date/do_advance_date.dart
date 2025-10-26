import 'package:casino_app/core/casino_manager.dart';
import 'package:casino_app/core/config.dart';
import 'dart:io';

class DoAdvanceDate {
  
  DoAdvanceDate();

  void execute(CasinoManager casinoManager){
    if (isConsoleMode){
      stdout.write("Insert date:");
      String? input = stdin.readLineSync();
      int? days = int.tryParse(input ?? '');
      if (days == null || days <= 0){
        //throw InvalidDateException
      }
      casinoManager.changeDate(days!);
      print("The new date is: ${casinoManager.date.day}");
    }
  }
}