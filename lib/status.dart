// TODO Implement this library.

// 환경 status 관리하는 클래스
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


///Widget들 사실상 아직 사용 안 함
/// 없애거나 지워도된다
class EnvWidget extends StatefulWidget {
  // final EnvTotalDemo envTotal;
  // EnvWidget({this.envTotal});

  @override
  _EnvWidgetState createState() => _EnvWidgetState();
}

class _EnvWidgetState extends State<EnvWidget> {

  final EnvTotalDemo envTotal;

//뭔지모르겠는데 일단씀
  void initState(){
    super.initState();
    envTotal.addListener((){ });
  }
  
  _EnvWidgetState({this.envTotal});

  //TODO: 현재 값 어떻게 보여줄거야?
  /// 임시로 스낵바로 바꿔놓음
  @override
  Widget build(BuildContext context) {
    return SnackBar(
      content: Text(
        "species: ${envTotal.species}, seaLevel: ${envTotal.seaLevel}, ozone:${envTotal.ozone}, temper: ${envTotal.temper}"
        ),
    );
  }
}


// 전체 환경 관리
// FIXME: 값 보여주는 위젯 새로고침할때 쓸라고 notifier 갖다넣음 (혹시몰라서 넣은것)
class EnvTotalDemo extends ChangeNotifier {
  int species, seaLevel, ozone, temper;

  //생성자
  EnvTotalDemo({this.species = 50, this.seaLevel = 50, this.ozone=50, this.temper=50});

  void effect(EnvStatus env){
    this.species += env.species;
    this.seaLevel += env.seaLevel;
    this.ozone += env.ozone;
    this.temper += env.temper;
    notifyListeners();
  }
}


// https://bezkoder.com/dart-flutter-constructors/
// 팩토리패턴 쓸 일이 있나?

/// 각 선택지마다 영향을 미치는 환경요소
class EnvStatus {
  final int species;
  final int seaLevel;
  final int ozone;
  final int temper;

  /// Named Option Parma으로 넣었는데
  /// 나중에 데이터 넣기 너무 귀찮으면 그냥 Position Optional로 바꿀래...
  /// https://stackoverflow.com/questions/52449508/constructor-optional-params
  EnvStatus({this.species = 0, this.seaLevel = 0, this.ozone = 0, this.temper =0});
}