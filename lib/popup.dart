import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'main.dart';
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
      title: new Text("파산했습니다."),
      content: new Text("올해의 모든 예산을 다 사용하여 파산했습니다.\n다음은 없습니다."),
      actions: <Widget>[
        new FlatButton(
          child: new Text("새로 시작해봅시다."),
          onPressed: () {
//            SystemNavigator.pop();
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
          title: new Text("파산했습니다."),
          content: new Text("올해의 모든 예산을 다 사용하여 파산했습니다.\n다음은 없습니다."),
          actions: <Widget>[
            new FlatButton(
              child: new Text("새로 시작해봅시다."),
              onPressed: () {
//                SystemNavigator.pop();
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

}