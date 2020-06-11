import 'package:flutter/material.dart';
import 'package:tinder_swipe_cards/status.dart';
import 'PlanetCard.dart';
import 'CardDetails.dart';
import 'PlanetCard.dart';
import 'PlanetCard.dart';
import 'PlanetCard.dart';
import 'cards.dart';

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
        home: HomePage());
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

  List<Widget> cardList = new List();

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
  }

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("임기 10년 째"),
        backgroundColor: Colors.purple,
      ),
      body: Stack(
        children: <Widget>[
          Container(alignment: Alignment.center,
              child: RaisedButton(
                child: Text('버튼을 눌러주세요!',textAlign: TextAlign.center,),
                onPressed: () {
                    setState(() {
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
    //planetCard에서 4개 가져오기
    const int CARDS_NUM = 4;
    List<PlanetCard> planetCard = demoPlanetCards.sublist(0,CARDS_NUM);
    for(int i = 0; i<CARDS_NUM; i++){
      planetCard[i].topMargin = ((i+5)*10).toDouble();
    }
    List<Widget> cardList = new List();
    //card 4개 보여주기
    for (int x = 0; x < CARDS_NUM; x++) {
      PlanetCard _current = planetCard[x];
      cardList.add(
        Positioned(
          top: _current.topMargin,
          //TODO: DraggableCard로 바꿔? child Card인데..
          child: Dismissible(
            key: ValueKey(x),
            direction: DismissDirection.horizontal,
//            crossAxisEndOffset: 1,
            onDismissed: (direction){
              int dir;
              direction == DismissDirection.endToStart? dir = 0 : dir = 1;
              setState(() {
                envTotalDemo.effect(_current.envStatus[dir]);
                print("sp:${envTotalDemo.species},sea:${envTotalDemo.seaLevel},ozo:${envTotalDemo.ozone},temp:${envTotalDemo.temper}");
                removeCards(x);
              });
            },
            child: CustomCard(_current),
          ),


          /// tinder처럼 움직이는 카드를 위한 코드
          /*
          child: Draggable(
              onDragEnd: (drag) {
                removeCards(x);
              },
              childWhenDragging: Container(),
              feedback: GestureDetector( //카드 드래그중일때 설정
                onTap: () {
                },
                /// 드래그하면 보여지는 카드
                child:
                CustomCard(planetCard[x]),
              ),
              child: GestureDetector(
              onTap:(){
                //nothing to do
              },
                /// 기본적으로 화면에 띄워지는 카드
                child:
                CustomCard(planetCard[x]),
              )
          ),*/

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

