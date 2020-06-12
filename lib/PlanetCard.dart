import './status.dart';

/// cardTitle : 카드 제목
/// 카드 리스트
/// 일단 디버깅하기 쉽도록 변화량을 title로 넣어놨다
/// TODO: 계절별로 카드 만들기
final List< List < PlanetCard > > demoPlanetCards = [
  //spring
  [  new PlanetCard(
    cardTitle: "종 +5 / 오존 +5",
    cardText: "봄1번째 ; 생명을 지킵시다 (생명존중 / 인간이 먼저다)",
    cardImage: "assets/photo_4.jpg",
    coin: [10, 20],
    envStatus: [
      EnvStatus(species: 5),
      EnvStatus(ozone: 5),
    ],
    selectText: [
      "왼쪽 선택지",
      "오른쪽 선택지"
    ],
    seasons: Seasons.SPRING,
    ),
    new PlanetCard(
      cardTitle: "종 +3 / 종 -3",
      cardText: "봄2번째 ",
      coin: [8, 3],
      cardImage: "assets/photo_1.jpg",
      envStatus: [
        EnvStatus(species: 3),
        EnvStatus(species: -3),
      ],
      selectText: [
        "왼쪽 선택지",
        "오른쪽 선택지"
      ],
      seasons: Seasons.SPRING,
    ),
  ],

  //summer
  [
    new PlanetCard(
      cardTitle: "종 -3, 해수면 +5 / 해수면 -5, 오존 +2, 기온 + 10",
      cardText: "기온이 38도인데 에어컨을 틀까? ( 버티기 / 틀기 )",
      cardImage: "assets/photo_1.jpg",
      coin: [7, 14],
      envStatus: [
        EnvStatus(species: -3, seaLevel: 5),
        EnvStatus(seaLevel: -5, ozone: 2, temper: 10),
      ],
      selectText: [
        "왼쪽 선택지",
        "오른쪽 선택지"
      ],
      seasons: Seasons.SUMMER,
    ),
    new PlanetCard(
      cardTitle: "해수면 +5 / 오존 +1, 기온 +1",
      cardText: "여름여름",
      coin: [5, 6],
      cardImage: "assets/photo_2.jpg",
      envStatus: [
        EnvStatus(seaLevel: 5),
        EnvStatus(ozone: 1, temper: 1),
      ],
      selectText: [
        "왼쪽 선택지",
        "오른쪽 선택지"
      ],
      seasons: Seasons.SUMMER,
    ),

  ],
  //fall
  [
    new PlanetCard(
      cardTitle: "(돈-1000하고싶다) 기온 +5 / 기온 +3",
      cardText: "가을. 늦었다. (택시 / 버스). 어딘가 예산도 넣고싶어요",
      cardImage: "assets/photo_2.jpg",
      coin: [7, 8],
      envStatus: [
        EnvStatus(temper: 5),
        EnvStatus(temper: 3),
      ],
      selectText: [
        "왼쪽 선택지",
        "오른쪽 선택지"
      ],
      seasons: Seasons.FALL,
    ),
    new PlanetCard(
      cardTitle: "종 -10 / 기온 + 10",
      cardText: "가을가을. 그냥 클래스 갖다넣으면 화면에는 알아서 보여주게해야함",
      cardImage: "assets/photo_4.jpg",
      coin: [7, 8],
      envStatus: [
        EnvStatus(species: -10),
        EnvStatus(temper: 10),
      ],
      selectText: [
        "왼쪽 선택지",
        "오른쪽 선택지"
      ],
    ),
  ],

  //winter
  [
    new PlanetCard(
      cardTitle: "모두 -10 / 모두 + 10",
      cardText: "겨울겨울. (예/ 아니오)",
      cardImage: "assets/photo_4.jpg",
      coin: [7, 8],
      envStatus: [
        EnvStatus(species: -10, seaLevel: -10, temper: -10, ozone: -10),
        EnvStatus(species: 10, seaLevel: 10, temper: 10, ozone: 10),
      ],
      selectText: [
        "왼쪽 선택지",
        "오른쪽 선택지"
      ],
      seasons: Seasons.WINTER,
    ),
    new PlanetCard(
      coin: [7, 8],
      cardTitle: "변화 X / 모두 + 5",
      cardText: "겨울. 변화량 글자쓰는거 너무 귀찮아... 2번째 겨울",
      cardImage: "assets/photo_1.jpg",
      envStatus: [
        EnvStatus(),
        EnvStatus(species: 5, seaLevel: 5, ozone: 5, temper: 5),
      ],
      selectText: [
        "왼쪽 선택지",
        "오른쪽 선택지"
      ],
      seasons: Seasons.WINTER,
    ),
  ],
];





// 이전 리포지토리의 PlanetCard과 같은 기능
class PlanetCard {
  String cardTitle;
  String cardText;
  String cardImage;
  List<String> selectText;
  double _topMargin;
  List<int> coin;

  Seasons seasons;  //계절. 나중에 SQL 넣으면 질의하기 쉬우라고 넣어놓음
  //TODO: add Env
  final List<EnvStatus> envStatus;

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