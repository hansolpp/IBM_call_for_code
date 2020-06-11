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


    for(int x = 0; x<CARDS_NUM; x++){
      cardList.add(
        Align(
          alignment: Alignment.topCenter,
          child: Padding(
              padding: EdgeInsets.only(top: ((x+20)*10).toDouble()),
//              padding: EdgeInsets.only(top: planetCard[i].topMargin),
              child: DraggableCard(
                  child: Card(
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
                                    planetCard[x].cardImage
                                ),
//                                NetworkImage(),
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
              )
                  ),
                ),
//                  child: FlutterLogo(size:128))
      );
    }

//    cardList.add(DraggableCard(child: FlutterLogo(size:128)));
//    cardList.add(DraggableCard(child: FlutterLogo(size:128)));
//    cardList.add(DraggableCard(child: FlutterLogo(size:128)));
//    cardList.add(DraggableCard(child: FlutterLogo(size:128)));
    return cardList;

    //card 4개 보여주기
    for (int x = 0; x < CARDS_NUM; x++) {
      cardList.add(
        Positioned(
          top: planetCard[x].topMargin,
          //TODO: DraggableCard로 바꿔? child Card인데..
          child: DraggableCard(
            //TODO: update child by using card items
            child: FlutterLogo(
              size: 128,
            ),
          ),
//
//          child: Draggable(
//              onDragEnd: (drag) {
//                removeCards(x);
//              },
//
//              childWhenDragging: Container(),
//              feedback: GestureDetector( //카드 드래그중일때 설정
//                onTap: () {
//                  print("Hello All");
//                },
//                /// 드래그하면 보여지는 카드
//                child: Card(
//                  elevation: 8.0,
//                  shape: RoundedRectangleBorder(
//                    borderRadius: BorderRadius.circular(20.0),
//                  ),
//                   color: Color.fromARGB(250, 112, 19, 179),
//                  child: Column(
//                    children: <Widget>[
//                      Hero(
//                        tag: "imageTag",
//                        child: Image.asset(
//                          planetCard[x].cardImage,
//                          width: 20.0,
//                          height: 440.0,
//                          fit: BoxFit.fill,
//                        ),
//                      ),
//                      Container(
//                        //드래그할때 보이는 글자 설정
//                        padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
//                        child: Text(
//                          planetCard[x].cardTitle,
//                          style: TextStyle(
//                            fontSize: 20.0,
//                            color: Colors.green,
//                          ),
//                        ),
//                      )
//                    ],
//                  ),
//                ),
//              ),
//              child: GestureDetector(
////                onTap: () {
////                  Navigator.of(context)
////                      .push(MaterialPageRoute(builder: (BuildContext context) {
////                    return CardDetails(planetCard[x].cardImage, x);
////                  }));
////                },
//              onTap:(){
//                //nothing to do
//              },
//                /// 기본적으로 화면에 띄워지는 카드
//                child: Card(
//                    elevation: 8.0,
//                    shape: RoundedRectangleBorder(
//                      borderRadius: BorderRadius.circular(20.0),
//                    ),
//                     color: Color.fromARGB(250, 112, 19, 179),
//                    child: Column(
//                      children: <Widget>[
//                        Container(
//                          decoration: BoxDecoration(
//                            borderRadius: BorderRadius.only(
//                                topLeft: Radius.circular(20.0),
//                                topRight: Radius.circular(20.0)),
//                            image: DecorationImage(
//                                image: AssetImage(
//                                    planetCard[x].cardImage
//                                ),
////                                NetworkImage(),
//                                fit: BoxFit.cover
//                            ),
//                          ),
//                          height: 300.0,
//                          width: 320.0,
//                        ),
//                        Container(
//                          width: 320,
//                          padding: EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10,right: 10),
//                          child: Column(
//                            children: <Widget> [
//                              Text(planetCard[x].cardTitle,
//                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.amber),
//                              ),
//                              Text(planetCard[x].cardText,
//                                style: TextStyle(fontSize: 20, color: Colors.white),
//                              ),
//                          ],
//                          )
//                        )
//                      ],
//                    )),
//              )
//          ),
        ),
      );
    }
    return cardList;
  }
}


