import 'package:flutter/material.dart';

import 'status.dart';



class Year_Popup extends StatefulWidget {
  final Widget child;
//  final Year_Popup Estimation_Card;
  Year_Popup({this.child}); //this.endingCard, 

  @override
  State createState() => _Year_PopupState(); //this.endingCard
}

/////
///

class _Year_PopupState extends State<Year_Popup> {

  //생성자에 올해 정보
  EnvTotalDemo envTotal = new EnvTotalDemo();

  @override
  void initState() {
    super.initState();
  }


  Widget build(BuildContext context) {
    return AlertDialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0)
                                    ),
                                    title: new Text("장관님 올해도 지났습니다"),
                                    content: new Text("이번년도의 기후변화 평가는 다음과 같습니다.${envTotal.species} 점수를 연동해서 보여주면 좋은데.."),
                                    actions: <Widget>[ 
                                      new FlatButton(
                                        child: new Text("다음 년도로 넘어가기"),
                                        onPressed: () {
                                          Navigator.pop(context);
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

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0)
                                    ),
                                    title: new Text("장관님 올해도 지났습니다"),
                                    content: new Text("이번년도의 기후변화 평가는 다음과 같습니다. 점수를 연동해서 보여주면 좋은데.."),
                                    actions: <Widget>[ 
                                      new FlatButton(
                                        child: new Text("다음 년도로 넘어가기"),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ],
                                  );
      },
    );
  }

}