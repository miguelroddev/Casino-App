import 'dart:collection';

import 'package:casino_app/core/card/card.dart';
import 'package:casino_app/core/card/hand.dart';
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

  takeCard(int idOfPlayer){
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

  void bet(Player player, int money){
    player.bet(money);
  }

  void addDealerCard(){
    _dealer.add(game.getCardFromDeck());
  }

  void addDealerHiddenCard(){
    _dealerHiddenCard = game.getCardFromDeck();
  }

  void revealDealerHiddenCard(){
    _dealer.add(_dealerHiddenCard!);
    _dealerHiddenCard = null;
  }

  List<Hand> getHands(int idPlayer){
    if (_mapPlayerHand[idPlayer] == null){
      //throw PlayerNotInRoundException
    }
    return _mapPlayerHand[idPlayer]!;
  }
  
}