enum Label {
  TITLE,
  SHOW_PROFIT;


  @override
  String toString(){
    switch (this){
      case Label.TITLE: return "Casino Management Menu";
      case Label.SHOW_PROFIT: return "Show Casino Profit";
    }
  }
}