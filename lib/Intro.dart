import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class Intro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primaryColor: Colors.black,//const Color.fromARGB(255, 0, 199, 0),
        accentColor: Colors.black,//.fromARGB(255, 222, 233, 226),
        brightness: Brightness.dark,
        canvasColor: Colors.amber[50],
      ),
      home: new MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State createState() => new MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {

  Animation<int> _characterCount;

  int _stringIndex;
  static const List<String> _kStrings = const <String>[
    '안녕하세요 장관님! 이번에 환경부 장관으로 임명되신것을 다시한번 축하드립니다. 현재 국내 기후 관련 환경 상황과 업무들을 간단히 브리핑하며 소개해드리도록 하겠습니다.',
    '장관님은 상반된 두 방향중 한가지의 정책만을 결정해야 합니다. 정책 카드를 왼쪽 또는 오른쪽으로 움직여 정책을 결정하실 수 있습니다.',
    '선택된 정책은 환경에 영향을 미치며, 환경에 긍정적인 영향을 끼치는 선택일수록 예산이 많이 소요됩니다.',
    '환경부에 4계절이 지나고 매년 예산이 새롭게 추가되며, 기존에 남아있는 예산은 회수하지 않습니다!'
    '세계를 살려주세요',
  ];
  String get _currentString => _kStrings[_stringIndex % _kStrings.length];


  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    TextStyle textStyle = theme.textTheme.title.copyWith(
      fontFamily: 'Courier New',
      color: theme.primaryColor,
    );

    return new Scaffold(
      floatingActionButton: new FloatingActionButton(
        child: new Icon(Icons.navigate_next),
        onPressed: () async {
          AnimationController controller = new AnimationController(
            duration: Duration(milliseconds: 4000),
            vsync: this,
          );
          setState(() {
            _stringIndex = _stringIndex == null ? 0 : _stringIndex + 1;
            if(_stringIndex == 3){
              //FIXME: Navigator.push대신 그냥 route로 바꾸기
//              Navigator.pushNamedAndRemoveUntil(context, '/HomePage', (_) => false);
//              Navigator.pushNamed(context, '/HomePage');
//              Navigator.pushReplacementNamed(context, '/HomePage');
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            }
            controller.duration = Duration(milliseconds: _kStrings[_stringIndex].length*50);
            _characterCount = new StepTween(begin: 0, end: _currentString.length)
                .animate(new CurvedAnimation(parent: controller, curve: Curves.easeIn));
          });
          await controller.forward();
          controller.dispose();
        },
      ),
      body: new Container(
        margin: new EdgeInsets.symmetric(vertical: 50.0, horizontal: 10.0),
        child: _characterCount == null ? null : new AnimatedBuilder(
          animation: _characterCount,
          builder: (BuildContext context, Widget child) {
            String text = _currentString.substring(0, _characterCount.value);
            return new Text(text, style: textStyle);
          },
        ),
      ),
    );
  }
}