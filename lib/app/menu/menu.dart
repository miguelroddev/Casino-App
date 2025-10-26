import 'dart:io';
import 'package:casino_app/core/casino_manager.dart';

import 'menu_option.dart';

class Menu {
  final String title;
  final List<MenuOption> options;

  Menu({required this.title, required this.options});

  void start(CasinoManager casinoManager) {
    while (true) {
      print('\n=== $title ===');
      for (int i = 0; i < options.length; i++) {
        print('${i + 1}. ${options[i].label}');
      }
      print('${options.length + 1}. Exit');
      stdout.write('Choose an option: ');
      final input = stdin.readLineSync();

      // the ?? means if the value on the left isn't null then use it otherwise use the value on the right,
      // so the code below is attempting to use the input, if it succeeds but the input isn't an
      // integer, then tryParse will return null, so then the code will do null ?? -1, and choose -1
      final index = int.tryParse(input ?? '') ?? -1;

      if (index >= 1 && index <= options.length) {
        options[index - 1].action(casinoManager);
      } else if (index == options.length + 1) {
        print('Exiting $title...');
        return; // the return here will either exit the submenu or the code
      } else {
        print('Invalid option.');
      }
    }
  }
}