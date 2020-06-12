// TODO Implement this library.

// 환경 status 관리하는 클래스
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'endings.dart';


///Widget들 사실상 아직 사용 안 함
/// 없애거나 지워도된다
class EnvWidget extends StatefulWidget {
  @override
  _EnvWidgetState createState() => _EnvWidgetState();
}

class _EnvWidgetState extends State<EnvWidget> {

  final EnvTotalDemo envTotal; 

//뭔지모르겠는데 일단씀
  void initState(){
    super.initState();
//    envTotal.addListener((){ });
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
class EnvTotalDemo {
  int species, seaLevel, ozone, temper;
  static const int defaultVal = 50;

  static final EnvTotalDemo _singleton = new EnvTotalDemo._internal();
  factory EnvTotalDemo(){
    return _singleton;
  }
  EnvTotalDemo._internal(){
    species = defaultVal;
    seaLevel = defaultVal;
    ozone= defaultVal;
    temper = defaultVal;
  }
  void reset() {
    this.species = defaultVal;
    this.seaLevel = defaultVal;
    this.ozone = defaultVal;
    this.temper = defaultVal;
  }


  //생성자
//  EnvTotalDemo({this.species = 50, this.seaLevel = 50, this.ozone=50, this.temper=50});

  void effect(EnvStatus env){
    this.species += env.species;
    this.seaLevel += env.seaLevel;
    this.ozone += env.ozone;
    this.temper += env.temper;
//    notifyListeners();
  }



  /// 특정 envstatus와 전체 환경변수값을 가져온다
  List<int> _getVal(EnvStatus _env, Status status){
    EnvTotalDemo _envTotal = new EnvTotalDemo();
    switch(status){
      case Status.species: return [_env.species, _envTotal.species];
      case Status.seaLevel: return [_env.seaLevel, _envTotal.seaLevel];
      case Status.ozone: return [_env.ozone, _envTotal.ozone];
      case Status.temper: return [_env.temper, _envTotal.temper];
      default: ;
    }
    return [-1,-1];  //this code should not be arrived
  }

  // 환경 변수(species, sealevel...) 가 엔딩 조건에 부합하는지 리턴
  bool _isOk(EnvStatus _endingEnv, Status status){
    int _env = _getVal(_endingEnv, status)[0];
    int _total = _getVal(_endingEnv, status)[1];

    if(_env == EnvStatus.UNDEFINED) return true;
    if(_env > 0 ) return _total > _env ;
    else if(_env < 0) return _total < -(_env);
    return false; //this must not be reached;
  }

  /// 엔딩을 낼 수 있는 상태인지 체크
  bool isOkToEnd(EndingCard ending){
    EnvStatus _endingEnv = ending.envStatus;
//    print("ending text: ${ending.cardText}");
//    print("species: ${_isOk(_endingEnv, Status.species)}");
//    print("seaLevel: ${_isOk(_endingEnv, Status.seaLevel)}");
//    print("ozone: ${_isOk(_endingEnv, Status.ozone)}");
//    print("temper: ${_isOk(_endingEnv, Status.temper)}");
    return
        _isOk(_endingEnv, Status.species) &&
        _isOk(_endingEnv, Status.seaLevel) &&
        _isOk(_endingEnv, Status.ozone) &&
        _isOk(_endingEnv, Status.temper);
    }

    ///가능한 엔딩 리스트를 구한다
  List<EndingCard> getEnableEndings(){
    List<EndingCard> enableEndings =
      endingList.where((ending) => isOkToEnd(ending)).toList();
    return enableEndings;
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
  static const int defaultVal = 0;
  static const int UNDEFINED = 987654321;

  /// Named Option Parma으로 넣었는데
  /// 나중에 데이터 넣기 너무 귀찮으면 그냥 Position Optional로 바꿀래...
  /// https://stackoverflow.com/questions/52449508/constructor-optional-params
  EnvStatus({this.species = defaultVal, this.seaLevel = defaultVal, this.ozone = defaultVal, this.temper =defaultVal});
  EnvStatus.ending({this.species = UNDEFINED, this.seaLevel = UNDEFINED, this.ozone = UNDEFINED, this.temper = UNDEFINED});
}

enum Status {
  species,
  seaLevel,
  ozone,
  temper
}