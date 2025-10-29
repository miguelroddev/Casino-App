enum Label {
  TITLE,
  SHOW_PLAYER,
  LIST_PLAYERS,
  CREATE_PLAYER,
  ADD_BANKROLL,
  DEBUG_SHOW_ATRIBUTES;

  @override
  String toString(){
    switch (this) {
      case Label.TITLE:return "Player Menu";
      case Label.LIST_PLAYERS:return "Show all Players";
      case Label.SHOW_PLAYER:return "Show Player by ID";
      case Label.CREATE_PLAYER: return "Create Player";
      case Label.ADD_BANKROLL:return "Add Bankroll";
      case Label.DEBUG_SHOW_ATRIBUTES: return "Debug Atributes";
    }
  }
}