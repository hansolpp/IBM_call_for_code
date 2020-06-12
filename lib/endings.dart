import 'package:flutter/material.dart';

import './status.dart';

///엔딩을 모아놓는 파일
///
///
final List<EndingCard> endingList = [
  new EndingCard(
    cardTitle: "species 70",
    cardText: "모기떼의 습격",
    cardImage: "assets/photo_8.png",
    envStatus: EnvStatus.ending(species: EndingCard.defaultVal),
  ),
  new EndingCard(
    cardTitle: "sealevel 70",
    cardText: "아틸란티스",
    cardImage: "assets/photo_7.png",
    envStatus: EnvStatus.ending(seaLevel: EndingCard.defaultVal),
  ),
  new EndingCard(
    cardTitle: "ozone 70",
    cardText: "zx파괴_오존xz",
    cardImage: "assets/photo_6.png",
    envStatus: EnvStatus.ending(ozone: EndingCard.defaultVal),
  ),
  new EndingCard(
    cardTitle: "temper 70",
    cardText: "불타죽음",
    cardImage: "assets/photo_5.jpg",
    envStatus: EnvStatus.ending(temper: EndingCard.defaultVal),
  ),
  new EndingCard(
    cardTitle: "temper >= 80, species <=70",
    cardText: "빙하기",
    cardImage: "assets/photo_8.png",
    envStatus: EnvStatus.ending(species: -EndingCard.defaultVal, temper: 80),
  ),
  new EndingCard(
    cardTitle: "sealevel 70, ozone >= 60",
    cardText: "모히또에서 몰디브한잔",
    cardImage: "assets/photo_1.png",
    envStatus: EnvStatus.ending(seaLevel: EndingCard.defaultVal, ozone: 60),
  ),
];


class EndingCard {
  String cardTitle;
  String cardText;
  String cardImage;
  /// 엔딩을 보는 기본 조건 값.
  static const int defaultVal = 70;
  /// 엔딩 조건
  /// 값이 + 인 경우 : 환경값이 엔딩값 '이상'인 경우 엔딩
  /// 값이 - 인 경우 : 환경값이 엔딩값 '이하'인 경우 엔딩
  final EnvStatus envStatus;

  EndingCard({
    this.cardTitle,
    this.cardText,
    this.cardImage,
    this.envStatus,
  });

}


/// 엔딩 팝업 (임시)
///
///
///

class EndingPopup extends StatefulWidget {
  final Widget child;
  final EndingCard endingCard;
  EndingPopup({this.endingCard, this.child});

  @override
  _EndingPopupState createState() => _EndingPopupState(this.endingCard);
}

class _EndingPopupState extends State<EndingPopup> {

  final EndingCard _endingCard;

  _EndingPopupState(this._endingCard);

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget build(BuildContext context) {
    return AlertDialog(
            title: Text('AlertDialog Title'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('This is a demo alert dialog.'),
                  Text('Would you like to approve of this message?'),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Approve'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
  }

//    return ChangeNotifierProvider<Counter>( // Counter 타입 사용. Counter 클래스의 데이터가 변하는지 보고 있다가 변하면 알려줍니다.
//      builder: (_) => Counter(0), // 초기값 정하기
//      child: MaterialApp(
//        title: 'Flutter Value',
//        theme: ThemeData(
//          primarySwatch: Colors.blue,
//        ),
//        home: HomePage(),
//      ),
//    );
//  }*/

  Future<void> _showMyDialog() async { //
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('AlertDialog Title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('This is a demo alert dialog.'),
                Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

}