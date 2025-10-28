enum Label {
  TITLE,
  SHOW_PLAYER,
  LIST_PLAYERS,
  CREATE_PLAYER;

  @override
  String toString(){
    switch (this) {
      case Label.TITLE:return "Player Menu";
      case Label.LIST_PLAYERS:return "Show all Players";
      case Label.SHOW_PLAYER:return "Show Player by ID";
      case Label.CREATE_PLAYER: return "Create Player";
    }
  }
}