import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tinder_swipe_cards/endings.dart';
import 'package:tinder_swipe_cards/status.dart';
import 'Coin.dart';
import 'Intro.dart';
import 'PlanetCard.dart';
import 'CardDetails.dart';
import 'cards.dart';
import 'package:flutter/services.dart';
import 'popup.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (context) => Intro(),
/*          '/cardDetails': (BuildContext context) {
            // return new CardDetails();
          },*/
//          '/HomePage' : (context) => HomePage(),
      },
    );
    //home: HomePage());
    //home: MyHomePage());
//        home: Intro());
  }
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {

  EnvTotalDemo envTotalDemo = new EnvTotalDemo();
  EndingPopup endingPopup = new EndingPopup();  //FIXME: 임시객체

  //전역변수
  List<Widget> cardList = new List();
  int CARD_START_NUM = 0;
  int CARDS_NUM = 4;
  Coin coin = new Coin();
  final List<String> _currentSeason = ["Spring", "Summer", "Fall", "Winter"];
  int _currentIdx = -1;

  void removeCards(index) {
    setState(() {
      cardList.removeAt(index);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cardList = _generateCards();
    SystemChrome.setEnabledSystemUIOverlays([]);
  }

  @override
  Widget build(BuildContext context) {


    // TODO: implement build
    return Scaffold(
      /// 연수 상단바 + 선정 상단바
      body: Container(
        color: Colors.amber,
        width: MediaQuery
            .of(context)
            .size
            .width,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center, // 주 축 기준 중앙
          children: <Widget>[
            /// 상단바
            Container(
              color: Colors.green,
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              height: 100,
              child: Align(
                alignment: Alignment.bottomCenter,
                //TODO: 카드 상태 따라 글자 바꾸기
                child: Text("${_currentIdx~/4 + 1}st ${_currentSeason[_currentIdx%4]}",
                    style: TextStyle(
                      fontSize: 56,
                    )),
              ),
            ),


            //stack container
            Expanded(
              child: Align(
                alignment: Alignment.topCenter,
                child: Stack(
                  children: <Widget>[

                    //리셋버튼
                    Container(alignment: Alignment.center,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(),
                        color: Colors.white,
                        child: Padding(
                          padding: EdgeInsets.only(top: 80,
                              left: 30,
                              right: 30,
                              bottom: 80),
                          child: Container(
                            child: Text(
                              '장관님!\n현재 기후변화 평가는\n00입니다.\n앞으로도 수고해주세요^^',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.lightBlue[900],
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        onPressed: () {
                          ///돈 모자랄때 엔딩
                          if (coin.coin < 0) {
                            setState(() {
                              coin = new Coin();
                              envTotalDemo.reset();
                              CARD_START_NUM = 0;
                              cardList = _generateCards();
                              _currentIdx = 0;
                            });
                          }
                          else {
                            setState(() {
                              CARD_START_NUM += CARDS_NUM;
                              cardList = _generateCards();
                            });
                          }
                        },
                      ),
                    ),
                    Container(
                      child: Stack(
                          alignment: Alignment.center, children: cardList),
                    ), // Card Stack
                  ],
                ),
              ),
            ),
            // bottom container
            Container( //TODO: 다 절대값으로 해놨다. 상대값으로 바꿀것...
              height: 100,
              color: Colors.cyanAccent,
              alignment: Alignment.center,
              child: Stack(
                children: <Widget>[
                  Container( //background
                    color: Colors.red,
                    alignment: Alignment.center,
                    height: 50,
                    margin: EdgeInsets.only(
                        left: 10, right: 10, top: 25, bottom: 25),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(left: 10, right: 10),
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Image.asset("assets/icons/comp_soso.jpg", width: 80,
                            height: 80,
                            fit: BoxFit.fill),
                        Image.asset("assets/icons/coin.png", width: 70,
                            height: 70,
                            fit: BoxFit.fill),
                        Text("${coin.coin}", style:TextStyle(fontSize: 42)),
                        Image.asset("assets/icons/env_soso.jpg", width: 80,
                            height: 80,
                            fit: BoxFit.fill),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _generateCards() {
    //planetCard에서 계절별로 하나씩 , 총 4개 가져오기
    List<PlanetCard> planetCard = new List();
    int _cnt = 0;
    _currentIdx++;
//    _currentIdx = _cnt;

    //spring random
    Random random = new Random();
    for(int i = 3; i>=0; i--){
      int idx = random.nextInt(demoPlanetCards[i].length);
      planetCard.add(demoPlanetCards[i][idx]);
    }

    //FIXME: sublist cards
    //margin값 설정하기
    for(int i = 0; i<CARDS_NUM; i++){
      planetCard[i].topMargin = ((i)*10+50).toDouble();
    }

    List<Widget> cardList = new List();
    //card 4개 보여주기
    for (int x = 0; x < CARDS_NUM; x++) {
      PlanetCard _current = planetCard[x];
      cardList.add(
        Positioned(
          top: _current.topMargin,
          child: Dismissible(
            key: ValueKey(x),
//            direction: DismissDirection.horizontal,
//            background: Container(child: Text("${_current.selectText[0]}"), color: Colors.red),
            secondaryBackground: Container(child: Text("${_current.selectText[1]}"), color: Colors.green),
            direction: coin.dir(_current.coin[0], _current.coin[1]),
            background: Container(
                child: Padding(
                  padding: EdgeInsets.only(right: 150),
                  child: Container(
                    child: Text("${_current.cardTitle}"),
                  ),
                ),
                color: Colors.red
            ),
//            secondaryBackground: Container(color: Colors.green),
//            crossAxisEndOffset: 1,
            onDismissed: (direction){
              int dir;
              direction == DismissDirection.endToStart? dir = 0 : dir = 1;
              //TODO: 임시로 팝업 뜨는거만 확인

              // COIN은 여기서
              if(dir == 1) coin.use(_current.coin[0]);
              else coin.use(_current.coin[1]);

              setState(() {
                envTotalDemo.effect(_current.envStatus[dir]);
                print("===========================================sp:${envTotalDemo.species},sea:${envTotalDemo.seaLevel},ozo:${envTotalDemo.ozone},temp:${envTotalDemo.temper}");
                removeCards(x);

                //TODO: 팝업 테스트
                List<EndingCard> enableEndings = envTotalDemo.getEnableEndings();
//                print("LENGTH: ${enableEndings.length}");
                if(enableEndings.isNotEmpty){
                  //조건을 만족하는 엔딩 중 랜덤으로 고르기
                  int idx = new Random().nextInt(enableEndings.length);
//                  print("leng: ${enableEndings.length}, idx: $idx");
                  showDialog(
                    context: context,
                    //TODO: 알람 내용 바꾸기
                    //TODO: 엔딩 가능 리스트중에서 랜덤으로 고르기
                    builder: (_) => EndingPopup(endingCard: enableEndings[idx],),
                    barrierDismissible: false,
                  );
                }
                _cnt++;
//                if(_currentIdx == 0) _currentIdx++;
                if((_currentIdx+1) % 4 != 0)_currentIdx ++;
//                _cnt > 3 ? _currentIdx : _currentIdx = _cnt;
//                print("==================currentIdx: $_currentIdx");


                print("CNT: ${_cnt}");
                if(_cnt == CARDS_NUM && coin.coin < 0) {
                  showDialog(
                    context: context,
                    //TODO: 알람 내용 바꾸기
                    //TODO: 엔딩 가능 리스트중에서 랜덤으로 고르기
                    builder: (_) => Year_Popup(),
                    barrierDismissible: false,
                  );
                }
              });
            },
            child: CustomCard(_current),
          ),
        ),
      );
    }
    return cardList;
  }
}

class CustomCard extends StatefulWidget{
  final Widget child;
  final PlanetCard _planetCard;
  CustomCard(this._planetCard, {this.child});

  @override
  _CustomCardState createState() => _CustomCardState(this._planetCard);
}

class _CustomCardState extends State<CustomCard> {

  PlanetCard _planetCard;
  _CustomCardState(this._planetCard);

  @override
  void initState(){
    super.initState();
  }

  @override
  void dispose(){
    super.dispose();
  }

  @override
  Widget build(BuildContext content){
    return Card(
        elevation: 8.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        color: Color.fromARGB(250, 112, 19, 179),
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0)),
                image: DecorationImage(
                    image: AssetImage(
                      _planetCard.cardImage,
                    ),
                    fit: BoxFit.cover
                ),
              ),
              height: 300.0,
              width: 320.0,
            ),
            Container(
                width: 320,
                height: 120,
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10,right: 10),
                child: Column(
                  //TODO: 크기 고정값
                  children: <Widget> [
                    Text(_planetCard.cardTitle,
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.amber),
                    ),
                    Text(_planetCard.cardText,
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ],
                )
            )
          ],
        ));
  }
}
