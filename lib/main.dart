import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tinder_swipe_cards/endings.dart';
import 'package:tinder_swipe_cards/status.dart';
import 'Intro.dart';
import 'PlanetCard.dart';
import 'CardDetails.dart';
import 'cards.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: <String, WidgetBuilder>{
          '/cardDetails': (BuildContext context) {
            // return new CardDetails();
          }
        },
        //home: HomePage());
        //home: MyHomePage());
        home: Intro());
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

      body: Stack(
        children: <Widget>[

          Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              alignment: Alignment(0.0, -1.0),
              child: RaisedButton(
                shape: RoundedRectangleBorder(),
                child: Text('상태창 어디까지 길어지려나',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  setState(() {

                  });
                },
              )
          ),

          Container(alignment: Alignment.center,
              child: RaisedButton(
                child: Text('버튼을 눌러주세요!',textAlign: TextAlign.center,),
                onPressed: () {
                    setState(() {
                      CARD_START_NUM += CARDS_NUM;
                      cardList = _generateCards();
                  });
                },
              )
          ),

          Container(
            //TODO: child draggablecard로 바꾸기
//            child: Stack(alignment: Alignment.center, children: cardList),
            child: Stack(alignment: Alignment.center, children:  cardList),
          ),
        ],
      )
    );
  }

  List<Widget> _generateCards() {
    //planetCard에서 계절별로 하나씩 , 총 4개 가져오기
    List<PlanetCard> planetCard = new List();
    //spring random
    Random random = new Random();
    for(int i = 3; i>=0; i--){
      int idx = random.nextInt(demoPlanetCards[i].length);
      planetCard.add(demoPlanetCards[i][idx]);
    }

    //margin값 설정하기
    for(int i = 0; i<CARDS_NUM; i++){
      planetCard[i].topMargin = ((i+10)*10).toDouble();
    }

    ///TODO: 임시 test func
    func(){
      print("hello world!");
      print(planetCard[0].seasons);
    }

    List<Widget> cardList = new List();
    //card 4개 보여주기
    for (int x = 0; x < CARDS_NUM; x++) {
//      func();
      PlanetCard _current = planetCard[x];
      cardList.add(
        Positioned(
          top: _current.topMargin,
          //TODO: DraggableCard로 바꿔? child Card인데..
          child: Dismissible(
            key: ValueKey(x),
            direction: DismissDirection.horizontal,
            background: Container(child: Text("${_current.selectText[0]}"), color: Colors.red),
            secondaryBackground: Container(child: Text("${_current.selectText[1]}"), color: Colors.green),
//            crossAxisEndOffset: 1,
            onDismissed: (direction){
              //TODO: add code here to do something when card dissapers
              int dir;
              direction == DismissDirection.endToStart? dir = 0 : dir = 1;
              //TODO: 임시로 팝업 뜨는거만 확인

//              endingPopup

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
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10,right: 10),
                child: Column(
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
