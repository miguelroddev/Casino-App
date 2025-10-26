import 'dart:collection';
import 'dart:io';

import 'package:casino_app/core/casino_manager.dart';
import 'package:casino_app/core/config.dart';
import 'package:casino_app/core/game/black_jack.dart';
import 'package:casino_app/core/player/player.dart';
import 'package:casino_app/core/round/bj21_round.dart';

class DoPlayBlackJack {
  void execute(CasinoManager casinoManager){
    if (isConsoleMode) {
      stdout.write("Insert Player ID: ");
      String? input = stdin.readLineSync();
      int? playerID = int.tryParse(input ?? '');
      if (playerID == null || playerID <= 0){
      //throw InvalidPlayerIdException
      }
      Player player = casinoManager.getPlayer(playerID!);
      
      stdout.write("Insert Number of Decks: ");
      String? input2 = stdin.readLineSync();
      int? numDecks = int.tryParse(input ?? '');
      if (numDecks == null || numDecks <= 0){
      //throw InvalidNumberOfDecksException
      //maybe I should also check if they are whole numbers
      }
      Set<Player> players = new HashSet();
      players.add(player);
      BlackJack game = BlackJack(numDecks!, players); 

    } //else flutter logic 

  }
}