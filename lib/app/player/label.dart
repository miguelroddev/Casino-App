enum Label {
  TITLE,
  SHOW_PLAYER,
  LIST_PLAYERS;

  @override
  String toString(){
    switch (this) {
      case Label.TITLE:return "Player Menu";
      case Label.LIST_PLAYERS:return "Show Player by ID";
      case Label.SHOW_PLAYER:return "Show all Players";
    }
  }
}