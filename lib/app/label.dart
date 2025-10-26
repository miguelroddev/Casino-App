enum Label {
  TITLE,

  DISPLAY_DATE,
  ADVANCE_DATE,
  OPEN_MENU_PLAYERS,
  OPEN_MENU_CASINO,
  OPEN_MENU_GAMES;

  @override
  String toString(){
    switch (this){
      case Label.TITLE: return "Main Menu";
      case Label.DISPLAY_DATE: return "Show Date";
      case Label.ADVANCE_DATE: return "Advance Date";
      case Label.OPEN_MENU_PLAYERS: return "Player Management Menu";
      case Label.OPEN_MENU_CASINO: return "Casino Management Menu";
      case Label.OPEN_MENU_GAMES: return "Game Menu";
    }
  }
}