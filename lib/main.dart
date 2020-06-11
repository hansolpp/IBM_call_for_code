import 'package:flutter/material.dart';
import 'PlanetCard.dart';
import 'CardDetails.dart';
import 'PlanetCard.dart';
import 'PlanetCard.dart';
import 'PlanetCard.dart';

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
            child: Stack(alignment: Alignment.center, children: cardList),
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
    // List<PlanetCard> planetCard = demoPlanetCards.sublist(0,4);
    print("lenght::${demoPlanetCards.length}");
    //FIXME: sublist cards
    List<PlanetCard> planetCard = demoPlanetCards;
    //margin값 설정하기
    for(int i = 0; i<4; i++){
      planetCard[i].topMargin = ((i+5)*10).toDouble();
    }

    //TODO: 여기서 생성하는 cardList를 PlanetCard에 있는 PlanetCards로 바꾸기
    //카드 정보를 가져와서 보여주는 위젯으로 만들기

    List<Widget> cardList = new List();

    for (int x = 0; x < 5; x++) {
      cardList.add(
        Positioned(
          top: planetCard[x].topMargin,
          child: Draggable(
              onDragEnd: (drag) {
                removeCards(x);
              },
              childWhenDragging: Container(),
              feedback: GestureDetector(
                onTap: () {
                  print("Hello All");
                },
                child: Card(
                  elevation: 8.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  // color: Color.fromARGB(250, 112, 19, 179),
                  child: Column(
                    children: <Widget>[
                      Hero(
                        tag: "imageTag",
                        child: Image.network(
                          planetCard[x].cardImage,
                          width: 20.0,
                          height: 440.0,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                        child: Text(
                          planetCard[x].cardTitle,
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.purple,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return CardDetails(planetCard[x].cardImage, x);
                  }));
                },
                child: Card(
                    elevation: 8.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    // color: Color.fromARGB(250, 112, 19, 179),
                    child: Column(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20.0),
                                topRight: Radius.circular(20.0)),
                            image: DecorationImage(
                                image: NetworkImage(planetCard[x].cardImage),
                                fit: BoxFit.cover),
                          ),
                          height: 300.0,
                          width: 320.0,
                        ),
                        Container(
                          width: 320,
                          padding: EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10,right: 10),
                          child: Column(
                            children: <Widget> [
                              Text("신재생에너지 선택의 갈림길", style:
                                TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                          Text(
                                "스타트업과 정부의 합작 작품으로,"
                                " 이번에 바이오연료가 개발되었습니다! "
                                "하지만 기존 석유 에너지 업체에서 반발이 심하네요.. "
                                "당신은 어떤 방향으로 갈지 결정해야합니다",
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.purple,
                            ),
                          ),
                          ]
                          )
                        )
                      ],
                    )),
              )),
        ),
      );
    }
    return cardList;
  }
}
