import 'package:flutter/material.dart';
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

  //TODO: PlanetCardList로 갖다쓰기
  // cardlist에 들어갈 카드들 생성하는 메소드 : 필요없음?
  // demoPlanetCards에서 4개씩 가져와야겠다

  List<Widget> _generateCards() {


    //화면에 보여줄 카드 4개 선택
    //planetCard에서 4개 가져오기
    const int CARDS_NUM = 4;
    List<PlanetCard> planetCard = demoPlanetCards.sublist(0,CARDS_NUM);

    //margin값 설정하기
    //TODO: margin 삭제해버리기
    for(int i = 0; i<CARDS_NUM; i++){
      planetCard[i].topMargin = ((i+5)*10).toDouble();
    }

    //TODO: 여기서 생성하는 cardList를 PlanetCard에 있는 PlanetCards로 바꾸기
    //카드 정보를 가져와서 보여주는 위젯으로 만들기

    List<Widget> cardList = new List();
    //FIXME: 임시 애니메이션 확인용
//
//    for(int i = 0; i<CARDS_NUM; ++i){
//      cardList.add(
//        Positioned(
//          top: planetCard[i].topMargin,
//          child: Draggable(
//            child: DraggableCard(
//              child: FlutterLogo(size: 128),
//            ),
//            feedback: DraggableCard(
//              child: FlutterLogo(size: 128),
//            ),
//            childWhenDragging: Container(),
//            onDragEnd: (dragDetails){},
//          ),
//        ),
//      );
//    }

//    cardList.add(
//      Align(
//        alignment: Alignment.topCenter,
//        child: DraggableCard(
//          child: FlutterLogo(
//            size: 250,
//          )
//        ),
//      ),
//
//    );

    ///NOTE: FROM HERE
    //FIXME: draggablecard 넣으니까
    // 움직임이 stack 안에서 고정된다....
    // 움직일때 양도 적어지고, stack 밖으로 못 나감!
    /*Alignment _alignment = Alignment.topCenter;
    for(int x = 0; x<CARDS_NUM; x++){
      _alignment += Alignment(0, 100.0);
      cardList.add(
      Positioned(
                  child: DraggableCard(
                  child: Card(
                    elevation: 8.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
//                    color: Color.fromARGB(250, 112, 19, 179),
                    color: Colors.green,
                    child: Column(
//                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20.0),
                                topRight: Radius.circular(20.0)),
                            image: DecorationImage(
                                image: AssetImage(
                                    planetCard[x].cardImage
                                ),
                                fit: BoxFit.cover
                            ),
                          ),
                          height: 150.0,
                          width: 320.0,
                        ),
                        Container(
                          width: 320,
                          padding: EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10,right: 10),
                          child: Column(
                            children: <Widget> [
                              Text(planetCard[x].cardTitle,
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.amber),
                              ),
                              Text(planetCard[x].cardText,
                                style: TextStyle(fontSize: 20, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )),
              ),
//             ),

          ),
//          child: Padding(
//              padding: EdgeInsets.only(top: ((x+20)*10).toDouble()),
//              padding: EdgeInsets.only(top: planetCard[i].topMargin),
//                  child: FlutterLogo(size:128))
      );
    }*/
///NOTE: TO HERE
//    cardList.add(DraggableCard(child: FlutterLogo(size:128)));
//    cardList.add(DraggableCard(child: FlutterLogo(size:128)));
//    cardList.add(DraggableCard(child: FlutterLogo(size:128)));
//    cardList.add(DraggableCard(child: FlutterLogo(size:128)));

    //card 4개 보여주기
    for (int x = 0; x < CARDS_NUM; x++) {
      PlanetCard _current = planetCard[x];
      cardList.add(
        Positioned(
          top: planetCard[x].topMargin,
          //TODO: DraggableCard로 바꿔? child Card인데..
          child: Draggable(
              onDragEnd: (drag) {
//                removeCards(planetCard[x]);
                removeCards(x);
              },

              childWhenDragging: Container(),
              feedback: GestureDetector( //카드 드래그중일때 설정
                onTap: () {
//                  print("Hello All");
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
//  CustomCard(planetCard, {this.child});
//    this._planetCard = planetCard.clone();
//  };

  @override
//  State<StatefulWidget> createState(){
//    return _CustomCardState(this._planetCard);
//  }
//  _CustomCardState createState(){
//    return
//  }
  _CustomCardState createState() => _CustomCardState(this._planetCard);
}

class _CustomCardState extends State<CustomCard> {

  PlanetCard _planetCard;
  _CustomCardState(this._planetCard);

//  PlanetCard _planetCard;
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

