import 'dart:async';

import 'package:casino_app/core/card/card.dart';
import 'package:casino_app/core/card/deck.dart';
import 'package:casino_app/core/card/hand.dart';
import 'package:casino_app/core/card/ranks.dart';
import 'package:casino_app/core/card/suit_type.dart';
import 'package:casino_app/core/config.dart';
import 'package:casino_app/core/exceptions/cannot_double_exception.dart';
import 'package:casino_app/core/exceptions/cannot_split_exception.dart';
import 'package:casino_app/core/exceptions/invalid_amount_of_decks_exception.dart';
import 'package:casino_app/core/exceptions/no_card_in_hand_exception.dart';
import 'package:casino_app/core/exceptions/not_ace_exception.dart';
import 'package:casino_app/core/exceptions/not_enough_money_exception.dart';
import 'package:casino_app/core/game/bj_game_states/bj_game_state.dart';
import 'package:casino_app/core/game/events/game_event.dart';
import 'package:casino_app/core/game/events/invalid_option_event.dart';
import 'package:casino_app/core/game/events/payout_single_hand_event.dart';
import 'package:casino_app/core/game/events/player_blackjack_event.dart';
import 'package:casino_app/core/game/events/player_bust_event.dart';
import 'package:casino_app/core/game/events/player_decision_event.dart';
import 'package:casino_app/core/game/events/player_double_event.dart';
import 'package:casino_app/core/game/events/player_hit_event.dart';
import 'package:casino_app/core/game/events/player_payout_event.dart';
import 'package:casino_app/core/game/events/player_reached21_event.dart';
import 'package:casino_app/core/game/game.dart';
import 'package:casino_app/core/game/game_type.dart';
import 'package:casino_app/core/player/player.dart';
import 'package:casino_app/core/round/bj21_round.dart';
import 'package:casino_app/core/round/round.dart';

class BlackJack extends Game{
  final StreamController<GameEvent> _controller = StreamController<GameEvent>();
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
  Stream<GameEvent> get stream => _controller.stream;
  BlackJackRound get round => super.round as BlackJackRound;
  Deck get deck => _deck;
  BJGameState? get gameState => _gameState;


  Future<void> emit(GameEvent event) async{
    _controller.add(event);
    await Future.delayed(Duration.zero);
  }

  void dispose() => _controller.close();

  void endGame(){
    Set<Player> _players = super.round.players;
    BlackJackRound round = BlackJackRound(_roundID, this, _players);
    _roundID++;
    setRound(round);
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
    if (numDecks <= 2 || numDecks > 8){
      throw InvalidAmountOfDecksException(numDecks);
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
      throw NoCardInHandException();
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

  Future<void> settleRound(int dealerValue) async{
    for (Player player in round.players) {
      double sumPayout = 0;
      int handIndex = 0;
      for (Hand hand in round.getHands(player.idPlayer)) {
        double temp = hand.payout(dealerValue); 
        sumPayout += temp;
        await emit(PayoutSingleHandEvent("", player, temp, handIndex));
        handIndex++;
      }
      player.payoutUpdate(sumPayout);
      final event = PlayerPayoutEvent("The player ${player.username} won in total $sumPayout €",
      player, sumPayout);
      await emit(event);
      player.clearBet();
    }
  }
  Future<void> handleHit(Hand hand, Player player) async{
    Card newCard = getCardFromDeck();
    hand.addCard(newCard);
    final event = PlayerHitEvent("You drew: ${newCard.rank.toString()} of ${newCard.suit.toString()}",
    newCard, player);
    await emit(event);
  }

  Future<void> handleDouble(Hand hand, Player player) async{
    if (player.sessionMoney >= hand.betAmount && hand.cards.length == 2) {
      player.bet(hand.betAmount);
      Card newCard = getCardFromDeck(); 
      hand.addCard(newCard);
      final event = PlayerDoubleEvent("You drew: ${newCard.rank.toString()} of ${newCard.suit.toString()}", 
      newCard, player, hand.cards);
      await emit(event);
    } else if(player.sessionMoney < hand.betAmount) {
      throw NotEnoughMoneyException();
    }
    else{
      throw CannotDoubleException();
    }
  }
  
  void handleSplit(Hand hand, Player player, int i){
    if (hand.cards.length == 2 &&
    hand.cards[0].value == hand.cards[1].value) {
      
      player.bet(hand.betAmount); // second bet
      round.splitHand(player.idPlayer, i);
    } else {
      throw CannotSplitException();
    }
  }

  Future<void> playerDecisions() async{
    BlackJackRound round = this.round;
    for (Player player in round.players) {
      int i = 0;
      for (var hand in List<Hand>.from(round.getHands(player.idPlayer))) {
        bool stand = false;

        if (hand.cards.length == 2 && hand.value == 21){
          double payout = hand.payout(0); // if it reaches here it means the dealer doesn't have BJ
          await emit(PlayerBlackjackEvent("BLACKJACK for ${player.username}! Instant payout of $payout", player, payout));
          player.payoutUpdate(payout);
          round.removeHand(player.idPlayer, hand);
          break;
        }

        while (!stand && hand.value < 21) {

          final event = PlayerDecisionEvent("Current hand value: ${hand.value}",player, hand.cards);
          await emit(event);
          final choice = await event.completer.future; // wait for the response!!!
          switch (choice) {
            case "H": // Hit
              handleHit(hand, player);
              break;

            case "S": // Stand
              stand = true;
              break;

            case "D": // Double down
              try {
                handleDouble(hand, player);
                stand = true;
              } catch (e){
                if (isConsoleMode){
                  print(e.toString());
                }
              }
              break;

            case "P": // sPlit
              try {
                handleSplit(hand, player, i);
                stand = true;
              } catch (e){
                if (isConsoleMode){
                  print(e.toString());
                }
              }
              break;

            default:
              await emit(InvalidOptionEvent("You selected an invalid option!", player));
          }
        
          if (hand.value > 21) {
            await emit(PlayerBustEvent("BUSTED! (${hand.value})", player, stand, hand.cards));
            round.increaseBustedHands();          
          }
          if (hand.value == 21){
            await emit(PlayerReached21Event("", player, stand, hand.cards));
            stand = true;
          }
        }
      }
    }
  }

  Card changeAceValue(Card ace){ // Unused method, maybe useful in the future
    if (ace.rank != Rank.ACE){
      throw NotAceException();
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