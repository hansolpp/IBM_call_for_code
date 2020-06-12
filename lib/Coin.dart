
class Coin {
  int _coin = 50;
  static const int MAXCOIN = 99;

  Coin();
  Coin.SetCoin(this._coin);

  int get coin => _coin;

  bool isPossible(int c) {
    if(_coin-c < 0) return false;
    return true;
  }

  int use(int c) {
    if(!isPossible(c)) return -1;
    _coin -= c;
    return _coin;
  }

  int add(int c) {
    if(_coin + c > MAXCOIN) return -1;
    _coin += c;
    return _coin;
  }
}