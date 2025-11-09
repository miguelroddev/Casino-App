import 'package:casino_app/core/game/black_jack.dart';

abstract class BJGameState {
  Future<void> execute();
}

/* 
1. StartRoundState — deal cards to players and dealer.

2. PlayerDecisionState — each player chooses: hit, stand, maybe split or double.

3. DealerPlayState — reveal dealer’s hidden card and draw cards according to rules.

4. PayoutState — evaluate outcomes, update balances.

5. EndState — cleanup, check if another round should start.

Note: there is no insurance.
*/