class Date {
  late int _day;

  //getters
  int get day => _day;

  Date (this._day);

  void advanceDay(int days){
    _day += days;
  }
}