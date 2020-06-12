
import 'package:flutter/cupertino.dart';

class Coin {
  int _coin = 50;
  static const int MAXCOIN = 99;

  Coin();
  Coin.SetCoin(this._coin);

  int get coin => _coin;

  DismissDirection dir(int c1, int c2) {
    print(c1);
    int min = c1 < c2 ? c1 : c2;
    int max = c1 > c2 ? c1 : c2;
    if(_coin - min < 0) {
      print("isEnd: 0");
      return null;
    }
    if(_coin - max >= 0) {print("isEnd: 1"); return DismissDirection.horizontal;}
    if(_coin - c1 < 0) {print("isEnd: 2");return DismissDirection.endToStart;}
    print("isEnd: 3");
    return DismissDirection.startToEnd;
  }
  bool isEnd(int c) {
    if(_coin < 0) return true;
    return false;
  }

  int use(int c) {
//    if(!isPossible(c)) return -1;
    _coin -= c;
    return _coin;
  }

  int add(int c) {
//    if(_coin + c > MAXCOIN) return -1;
    _coin += c;
    return _coin;
  }
}