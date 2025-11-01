import 'dart:io';

import 'package:casino_app/core/card/card.dart';
import 'package:casino_app/core/card/deck.dart';
import 'package:casino_app/core/card/hand.dart';
import 'package:casino_app/core/card/ranks.dart';
import 'package:casino_app/core/card/suit_type.dart';
import 'package:casino_app/core/config.dart';
import 'package:casino_app/core/game/bj_game_state.dart';
import 'package:casino_app/core/game/game.dart';
import 'package:casino_app/core/game/game_type.dart';
import 'package:casino_app/core/player/player.dart';
import 'package:casino_app/core/round/bj21_round.dart';
import 'package:casino_app/core/round/round.dart';

class BlackJack extends Game{
  late Deck _deck;
  BJGameState? _gameState;
  int _roundID = 1;

  BlackJack(int numDecks, Set<Player> players) : super(GameType.BLACK_JACK){
    _deck = generateBlackjackDeck(numDecks);
    BlackJackRound round = BlackJackRound(_roundID, this, players);
    _roundID++;
    setRound(round);
  }

  //getter
  @override
  BlackJackRound get round => super.round as BlackJackRound;
  Deck get deck => _deck;
  BJGameState? get gameState => _gameState;

  
  void endGame(){
    Set<Player> _players = super.round.players;
    BlackJackRound round = BlackJackRound(_roundID, this, _players);
    _roundID++;
    setRound(round);
  }
  void checkGameEnd(){}
  void startRound(){
    
  }

  void removePlayer(int playerID) {
    round.players.removeWhere((player) => player.idPlayer == playerID);
  }


  Card getCardFromDeck(){
    return deck.takeCard();
  }

  int getValue(Rank rank){
    switch (rank) {
      case Rank.ACE:
        return 11; // future logic check can alter this value
      case Rank.TWO:
        return 2;
      case Rank.THREE:
        return 3;
      case Rank.FOUR:
        return 4;
      case Rank.FIVE:
        return 5;
      case Rank.SIX:
        return 6;
      case Rank.SEVEN:
        return 7;
      case Rank.EIGHT:
        return 8;
      case Rank.NINE:
        return 9;
      case Rank.TEN:
        return 10;
      case Rank.JACK:
        return 10;
      case Rank.QUEEN:
        return 10;
      case Rank.KING:
        return 10;
    }
  }

  void updateGameState(BJGameState gameState){
    _gameState = gameState;
  }

  Deck generateBlackjackDeck(int numDecks) {
    if (numDecks <= 0 || numDecks > 8){
      //throw InvalidAmountDecksException 
    }
    
    List<Card> deck = [];
    List<Rank> ranks = Rank.values;

    for (int i=0; i<numDecks; i++) {
      for (SuitType suit in SuitType.values) {
        for (Rank rank in ranks) {
          int value = getValue(rank);
          deck.add(Card(suit, value, rank));
        }
      }
    }
    deck.shuffle();
    return new Deck(GameType.BLACK_JACK, deck);
  }

  Deck shuffle(Deck deck){
    deck.cardsAtuais.shuffle();
    return deck;
  }

  int calculateHand(List<Card> cards){
    if (cards.isEmpty){
      //throw NoCardInHandException
    }
    int sum = 0;
    int numAce = 0;
    for (Card card in cards){
      if(card.rank == Rank.ACE){
        numAce += 1;
      }else{
        sum += card.value;
      }
    }
    if(numAce>0){
      if (sum +11 + numAce -1 <= 21){ //there can never be 2 Aces with the value of 11
        return sum +11 + numAce -1;
      }
      else{
        return sum + numAce;
      }
    }
    return sum;
  }

  void applyPlayerBetsToHands() {
    for (Player player in round.players) {
      final hands = round.getHands(player.idPlayer);

      if (hands.isEmpty) {
        round.addCardToMap(player.idPlayer, getCardFromDeck());
        hands[0].cards.clear();
      }

      //we are assuming the player can only have 1 hand in each Round tobefixed
      final Hand hand = hands.first;
      hand.addBet(player.totalMoneyBetted);
    }
  }

  void settleRound(int dealerValue){
    print("settleRound Dealer Value: $dealerValue");
    for (Player player in round.players) {
      double sumPayout = 0;
      for (Hand hand in round.getHands(player.idPlayer)) {
        sumPayout += hand.payout(dealerValue);
      }
      print("The payout was $sumPayout");
      player.payoutUpdate(sumPayout);
      if (isConsoleMode){
        print("The player ${player.username} won a net value of $sumPayout");
      }
      player.clearBet();
    }
  }

  void playerDecisions() {
    BlackJackRound round = this.round;
    for (Player player in round.players) {
      if (isConsoleMode){
        print("\n--- ${player.username}'s turn ---");
      }

      for (int i = 0; i < round.getHands(player.idPlayer).length; i++) {
        Hand hand = round.getHands(player.idPlayer)[i];
        bool stand = false;

        if (hand.cards.length == 2 && hand.value == 21){
          double payout = hand.payout(0); // if it reaches here it means the dealer doesn't have BJ
          player.payoutUpdate(payout);
          round.removeHand(player.idPlayer, hand);
          if (isConsoleMode) {
            print("BLACKJACK for ${player.username}! Instant payout of $payout");
          }
          break;
        }

        while (!stand && hand.value < 21) {
          if (isConsoleMode){
            print("\nCurrent hand value: ${hand.value}");
            hand.printHand();
            stdout.write("\nOptions: (H)it, (S)tand, (D)ouble, (P)Split (if possible): ");
            String? choice = stdin.readLineSync()?.toUpperCase();
            switch (choice) {
              case "H": // Hit
                Card newCard = getCardFromDeck();
                hand.addCard(newCard);
                print("You drew: ${newCard.rank.toString()} of ${newCard.suit.toString()}");
                break;

              case "S": // Stand
                stand = true;
                break;

              case "D": // Double down
                if (player.sessionMoney >= hand.betAmount) {
                  player.addBet(hand.betAmount);
                  hand.addCard(getCardFromDeck());
                  if (isConsoleMode) {
                    hand.printHand();
                  }
                  stand = true;
                } else {
                  //throw NotEnoughMoneyException
                }
                break;

              case "P": // Split
                if (hand.cards.length == 2 &&
                    hand.cards[0].value == hand.cards[1].value) {
                  player.addBet(hand.betAmount); // second bet
                  round.splitHand(player.idPlayer, i);
                  print("Hand split!");
                } else {
                  if (isConsoleMode){
                    print("You can't split this hand.");
                  }
                }
                break;

              default:
                if (isConsoleMode){
                  print("invalid Option");
                }
            }
          }
          
          if (hand.value > 21) {
            if (isConsoleMode){
              print("BUSTED! (${hand.value})");
            }
          }
          if (hand.value == 21){
            stand = true;
            hand.printHand();
          }
        }
      }
    }
  }


  Card changeAceValue(Card ace){ // useless method? maybe.
    if (ace.rank != Rank.ACE){
      //throw NotAceException
    }
    if (ace.value == 11){
      ace.changeValue(1);
      return ace;
    }else{
      ace.changeValue(11);
      return ace;
    }
  }
}