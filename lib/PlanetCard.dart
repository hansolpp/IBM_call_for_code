
import 'package:tinder_swipe_cards/Coin.dart';
import './status.dart';

/// cardTitle : 카드 제목
/// 카드 리스트
/// 일단 디버깅하기 쉽도록 변화량을 title로 넣어놨다
/// TODO: 계절별로 카드 만들기
final List< List < PlanetCard > > demoPlanetCards = [
  //spring
  [  new PlanetCard(
    cardTitle: "종 +5 / 오존 +5",
    cardText: "폐기물도 에너지 활용할까요?",
    cardImage: "assets/trash.png",
    coin: [10, 20],
    envStatus: [
      EnvStatus(ozone: -5),
      EnvStatus(ozone: 5),
    ],
    selectText: [
      "폐기물을 에너지로 사용할 수 있는 육성 투자 시행",
      "폐기물을 에너지를 사용하는 방안에 대해 아직 활용 방안에 대한 정확한 통계와 정의가 없으므로 투자를 유보"
    ],
    seasons: Seasons.SPRING,
    ),
    // new PlanetCard(
    //   cardTitle: "종 +3 / 종 -3",
    //   cardText: "봄2번째 ",
    //   cardImage: "assets/energy.png",
    //   envStatus: [
    //     EnvStatus(species: 3),
    //     EnvStatus(species: -3),
    //   ],
    //   selectText: [
    //     "왼쪽 선택지",
    //     "오른쪽 선택지"
    //   ],
    //   seasons: Seasons.SPRING,
    // ),
  ],

  //summer
  [
    new PlanetCard(
      cardTitle: "종 -3, 해수면 +5 / 해수면 -5, 오존 +2, 기온 + 10",
      cardText: "저탄소 사회 전환을 위해",
      cardImage: "assets/energy.png",
      coin: [8, 7],
      envStatus: [
        EnvStatus(species: 5, seaLevel: 5, ozone:10),
        EnvStatus(seaLevel: -5, ozone: -10, temper: -10),
      ],
      selectText: [
        "석탄화력발전소 강제성을 띈 단계적 감축 방안",
        "탈석탄시 부족한 에너지원으로 생산활동 억제 및 가계비 부담 문제로 보류"
      ],
      seasons: Seasons.SUMMER,
    ),
    // new PlanetCard(
    //   cardTitle: "해수면 +5 / 오존 +1, 기온 +1",
    //   cardText: "유엔기후변화협약",
    //   cardImage: "assets/meeting.png",
    //   envStatus: [
    //     EnvStatus(seaLevel: 1, ozone:1, temper:1),
    //     EnvStatus(ozone: -1, temper: -1),
    //   ],
    //   selectText: [
    //     "유대사를 만나 유엔기후변화협약이 국내에 어떻게 적용될 수 있는지 조언을 얻기",
    //     "국내의 다른 환경 문제에 집중"
    //   ],
    //   seasons: Seasons.SUMMER,
    // ),

  ],
  //fall
  [
    new PlanetCard(
      cardTitle: "(돈-1000하고싶다) 기온 +5 / 기온 +3",
      cardText: "친환경 대중교통",
      cardImage: "assets/transpo.png",
      coin: [6, 9],
      envStatus: [
        EnvStatus(temper: 5),
        EnvStatus(temper: 3),
      ],
      selectText: [
        "친환경 버스를 도입을 위한 관련 부처와 협의",
        "문제는 버스 한 대당 초기 비용이 매우 높으므로 보류"
      ],
      
      seasons: Seasons.FALL,
    ),
    new PlanetCard(
      cardTitle: "종 -10 / 기온 + 10",
      cardText: "한반도 이상 기후 현상으로 겨울에도 고온 현상 기록",
      cardImage: "assets/animal.jpg",
      coin: [9, 10],
      envStatus: [
        EnvStatus(species: 10),
        EnvStatus(species: -10),
      ],
      selectText: [
        "제주 및 난아열대 지역의 식물보전을 위해 1160여 종 1만 5400여 점의 종자 저장",
        "생물 다양성 지표도 마련되지 않았기 때문에, 종다양서을 위한 전폭적인 투자는 좀 어려울 것"
      ],
      seasons: Seasons.FALL
    ),
  ],

  //winter
  [
    new PlanetCard(
      cardTitle: "해수면 +5 / 오존 +1, 기온 +1",
      cardText: "유엔기후변화협약",
      cardImage: "assets/meeting.png",
      coin: [16, 5],
      envStatus: [
        EnvStatus(seaLevel: 1, ozone:1, temper:1),
        EnvStatus(ozone: -1, temper: -1),
      ],
      selectText: [
        "유대사를 만나 유엔기후변화협약이 국내에 어떻게 적용될 수 있는지 조언을 얻기",
        "국내의 다른 환경 문제에 집중"
      ],
      seasons: Seasons.WINTER,
    ),
//     new PlanetCard(
//       cardTitle: "변화 X / 모두 + 5",
//       cardText: "겨울. 변화량 글자쓰는거 너무 귀찮아... 2번째 겨울",
//       cardImage: "assets/photo_1.jpg",
//       envStatus: [
//         EnvStatus(),
//         EnvStatus(species: 5, seaLevel: 5, ozone: 5, temper: 5),
//       ],
//       selectText: [
//         "왼쪽 선택지",
//         "오른쪽 선택지"
//       ],
//       seasons: Seasons.WINTER,
//     ),
  ],
 ];





// 이전 리포지토리의 PlanetCard과 같은 기능
class PlanetCard {
  String cardTitle;
  String cardText;
  String cardImage;
  List<String> selectText;
  double _topMargin;
  Seasons seasons;  //계절. 나중에 SQL 넣으면 질의하기 쉬우라고 넣어놓음
  //TODO: add Env
  final List<EnvStatus> envStatus;
  List<int> coin;


  //   this.cardTitle = title;
  //생성자
  // PlanetCard(String title, String cardText, String imagePath, double marginTop) {
  //   this.cardText = cardText;
  //   this.cardImage = imagePath;
  //   this.topMargin = marginTop;
  PlanetCard({
    this.cardTitle,
    this.cardText,
    this.cardImage,
    this.envStatus,
    this.seasons,
    this.selectText,
    this.coin,
    // this.topMargin
  });
  // }

  set topMargin(double topMargin){
    this._topMargin = topMargin;
  }

  get topMargin => _topMargin;
}

enum Seasons {
  SPRING,
  SUMMER,
  FALL,
  WINTER
}