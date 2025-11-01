import 'dart:collection';

import 'package:casino_app/core/card/card.dart';
import 'package:casino_app/core/card/hand.dart';
import 'package:casino_app/core/config.dart';
import 'package:casino_app/core/game/black_jack.dart';
import 'package:casino_app/core/game/game.dart';
import 'package:casino_app/core/player/player.dart';
import 'package:casino_app/core/round/round.dart';

class BlackJackRound extends Round{
  Map<int, List<Hand>> _mapPlayerHand = new HashMap();
  List<Card> _dealer = [];
  late Card? _dealerHiddenCard;

  BlackJackRound(int idRound, BlackJack _game, Set<Player> _players):super(idRound, _game, _players){}

  //getters
  @override
  BlackJack get game => super.game as BlackJack;
  List<Card> get dealer => _dealer;
  Card? get dealerHiddenCard => _dealerHiddenCard;
  


  // takeCard != Hit, takeCard is automatic/beggining of the round

  void takeCard(int idOfPlayer){
    bool idExists = false;
    Player _player;
    for (Player player in players){
      if (player.idPlayer == idOfPlayer){
        idExists = true;
        _player = player;
      }
    }
    if (idExists == false){
      //throw PlayerNotInRoundException
    }
    Card temp = game.getCardFromDeck();
    addCardToMap(idOfPlayer, temp);
  }


  void removePlayer(int playerID) {
    players.removeWhere((player) => player.idPlayer == playerID);
  }

  void addCardToMap(int playerID, Card card, {int handIndex = 0}){
    _mapPlayerHand.putIfAbsent(playerID, () => [Hand(playerID)]);

    List<Hand> hands = _mapPlayerHand[playerID]!;

    //in case of a split:
    if (handIndex >= hands.length) {
      for (int i = hands.length; i <= handIndex; i++) {
        hands.add(Hand(playerID));
      }
    }
    hands[handIndex].addCard(card);
  }

  void bet(Player player, double money){
    player.bet(money);
  }

  void addDealerCard(){
    _dealer.add(game.getCardFromDeck());
  }

  void removeHiddenCard(){
    _dealer.add(_dealerHiddenCard!);
    _dealerHiddenCard = null;
  }

  void addDealerHiddenCard(){
    _dealerHiddenCard = game.getCardFromDeck();
  }

  void revealDealerHiddenCard(){
    if (_dealerHiddenCard == null){
      _dealer.add(_dealerHiddenCard!);
      _dealerHiddenCard = null;
    }
  }

  void splitHand(int playerID, int handIndex) {
    List<Hand> hands = _mapPlayerHand[playerID]!;

    if (handIndex < 0 || handIndex >= hands.length) {
      // throw InvalidHandIndexException
    }
    Hand original = hands[handIndex];
    if (original.cards.length != 2 ||
        original.cards[0].value != original.cards[1].value) {
      // throw InvalidSplitException
    }
    Card splitCard = original.cards.removeLast();
    Hand newHand = Hand(playerID);
    newHand.addCard(splitCard);

    //Each Hand gets one new card from the deck
    original.addCard(game.getCardFromDeck());
    newHand.addCard(game.getCardFromDeck());

    // Insert the new hand right after the original one
    hands.insert(handIndex + 1, newHand);

    if (isConsoleMode) {
      print("Split successful! New hands:");
      for (int i = 0; i < hands.length; i++) {
        print("Hand number ${i + 1}:");
        hands[i].printHand();
      }
    }
  }


  List<Hand> getHands(int idPlayer){
    if (_mapPlayerHand[idPlayer] == null){
      //throw PlayerNotInRoundException
    }
    return _mapPlayerHand[idPlayer]!;
  }
  
  void printHands(List<Hand> Hands){
    int i =1;
    for (Hand hand in Hands){
      print("Hand number $i: ");
      hand.printHand();
      i++;
    }
  }

  void removeHand(int playerID, Hand hand) {
    if (!_mapPlayerHand.containsKey(playerID)) {
      // throw PlayerNotInRoundException
    }

    _mapPlayerHand[playerID]!.remove(hand);

    if (_mapPlayerHand[playerID]!.isEmpty) {
      _mapPlayerHand.remove(playerID);
    }

    if (isConsoleMode) {
      print("Removed a completed hand for player $playerID.");
    }
  }

  void printDealer() {
    print("\nDealer's cards:");

    if (_dealer.isEmpty && _dealerHiddenCard == null) {
      //throw NoCardsInHandException
    }
    final visibleCards = List<Card>.from(_dealer);

    final cardLines = visibleCards.map((card) {
      final rankStr = card.rank.toString();
      final suitStr = card.suit.toPicture();

      return [
        "┌─────────┐",
        "│$rankStr${rankStr.length == 1 ? ' ' : ''}       │",
        "│    $suitStr    │",
        "│       ${rankStr.length == 1 ? ' ' : ''}$rankStr│",
        "└─────────┘",
      ];
    }).toList();

    for (int i = 0; i < cardLines[0].length; i++) {
      print(cardLines.map((lines) => lines[i]).join(" "));
    }
  }
}