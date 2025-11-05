import 'package:casino_app/core/card/card.dart';

class ConsoleCardUtils {
  static List<String> alignCardsHorizontally(List<Card> cards) {
    if (cards.isEmpty) return [];

    final cardLines = cards.map((card) => card.toConsoleLines()).toList();
    final result = <String>[];

    for (int i = 0; i < cardLines.first.length; i++) {
      result.add(cardLines.map((lines) => lines[i]).join(' '));
    }

    return result;
  }
}