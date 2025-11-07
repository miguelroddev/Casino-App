import 'dart:collection';

import 'package:casino_app/core/card/card.dart';
import 'package:casino_app/core/card/hand.dart';
import 'package:casino_app/core/config.dart';
import 'package:casino_app/core/exceptions/invalid_hand_index_exception.dart';
import 'package:casino_app/core/exceptions/invalid_split_exception.dart';
import 'package:casino_app/core/exceptions/no_card_in_hand_exception.dart';
import 'package:casino_app/core/exceptions/no_hidden_card_exception.dart';
import 'package:casino_app/core/exceptions/player_not_in_round_exception.dart';
import 'package:casino_app/core/game/black_jack.dart';
import 'package:casino_app/core/game/game.dart';
import 'package:casino_app/core/player/player.dart';
import 'package:casino_app/core/round/round.dart';

class BlackJackRound extends Round{
  Map<int, List<Hand>> _mapPlayerHand = new HashMap();
  List<Card> _dealer = [];
  Card? _dealerHiddenCard = null;
  int _numberOfBusted = 0;

  BlackJackRound(int idRound, BlackJack _game, Set<Player> _players):super(idRound, _game, _players){}

  //getters
  @override
  BlackJack get game => super.game as BlackJack;
  List<Card> get dealer => _dealer;
  Card? get dealerHiddenCard => _dealerHiddenCard;
  int get numberOfBusted => _numberOfBusted;
  


  // takeCard != Hit, takeCard is automatic/beggining of the round
  Card takeCard(int idOfPlayer){
    bool idExists = false;
    Player _player;
    for (Player player in players){
      if (player.idPlayer == idOfPlayer){
        idExists = true;
        _player = player;
      }
    }
    if (idExists == false){
      throw PlayerNotInRoundException(idOfPlayer);
    }
    Card temp = game.getCardFromDeck();
    addCardToMap(idOfPlayer, temp);
    return temp;
  }


  void removePlayer(int playerID) {
    players.removeWhere((player) => player.idPlayer == playerID);
  }

  List<Hand> getHands(int idPlayer){
    if (_mapPlayerHand[idPlayer] == null){
      throw PlayerNotInRoundException(idPlayer);
    }
    return _mapPlayerHand[idPlayer]!;
  }
  
  Hand getHand(int playerID, {int handIndex = 0}){
    List<Hand> _hands = getHands(playerID);
    return _hands[handIndex];
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

  Card addDealerCard(){
    Card temp = game.getCardFromDeck();
    _dealer.add(temp);
    return temp;
  }

  Card removeHiddenCard(){
    Card temp = _dealerHiddenCard!;
    _dealer.add(_dealerHiddenCard!);
    _dealerHiddenCard = null;
    return temp;
  }

  void addDealerHiddenCard(){
    _dealerHiddenCard = game.getCardFromDeck();
  }

  Card revealDealerHiddenCard(){
    if (_dealerHiddenCard == null){
      throw NoHiddenCardException();
    }
    final temp = _dealerHiddenCard!;
    _dealer.add(_dealerHiddenCard!);
    _dealerHiddenCard = null;
    return temp;
  }

  void splitHand(int playerID, int handIndex) {
    List<Hand> hands = _mapPlayerHand[playerID]!;

    if (handIndex < 0 || handIndex >= hands.length) {
      throw InvalidHandIndexException(handIndex);
    }
    Hand original = hands[handIndex];
    if (original.cards.length != 2 ||
        original.cards[0].value != original.cards[1].value) {
      throw InvalidSplitException();
    }
    Card splitCard = original.cards.removeLast();
    Hand newHand = Hand(playerID);
    newHand.addCard(splitCard);

    //Each Hand gets one new card from the deck
    original.addCard(game.getCardFromDeck());
    newHand.addCard(game.getCardFromDeck());

    // Insert the new hand right after the original one
    hands.insert(handIndex + 1, newHand);
    
  }


  

  void removeHand(int playerID, Hand hand) {
    if (!_mapPlayerHand.containsKey(playerID)) {
      throw PlayerNotInRoundException(playerID);
    }

    _mapPlayerHand[playerID]!.remove(hand);

    if (_mapPlayerHand[playerID]!.isEmpty) {
      _mapPlayerHand.remove(playerID);
    }

    // if (isConsoleMode) {
    //   print("Removed a completed hand for player $playerID.");
    // }
  }

  int getNumberOfHands() {
    int total = 0;
    for (var entry in _mapPlayerHand.entries) {
      total += entry.value.length;
    }
    return total;
  }

  void increaseBustedHands({int num = 1}){
    _numberOfBusted += num;
  }

}