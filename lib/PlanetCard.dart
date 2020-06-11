/// cardTitle : 카드 제목
/// 카드 리스트
/// 일단 디버깅하기 쉽도록 변화량을 title로 넣어놨다
/// margin은 나중에 생성할때 결정하기 - generate Card할때
final List < PlanetCard > demoPlanetCards = [
  new PlanetCard(
    cardTitle: "종 +5 / 오존 +5",
    cardText: "봄1번째 ; 생명을 지킵시다 (생명존중 / 인간이 먼저다)",
    cardImage: "assets/photo_4.jpg",
    // envStatus: [
    //   EnvStatus(species: 5),
    //   EnvStatus(ozone: 5),
    // ],
  ),
  new PlanetCard(
    cardTitle: "종 -3, 해수면 +5 / 해수면 -5, 오존 +2, 기온 + 10",
    cardText: "기온이 38도인데 에어컨을 틀까? ( 버티기 / 틀기 )",
    cardImage: "assets/photo_1.jpg",
    // envStatus: [
    //   EnvStatus(species: -3, seaLevel: 5),
    //   EnvStatus(seaLevel: -5, ozone: 2, temper: 10),
    // ],
  ),
  new PlanetCard(
    cardTitle: "(돈-1000하고싶다) 기온 +5 / 기온 +3",
    cardText: "늦었다. (택시 / 버스). 어딘가 예산도 넣고싶어요",
    cardImage: "assets/photo_2.jpg",
    // envStatus: [
    //   EnvStatus(temper: 5),
    //   EnvStatus(temper: 3),
    // ],
  ),
  new PlanetCard(
    cardTitle: "모두 -10 / 모두 + 10",
    cardText: "사진이 4개밖에 안들어가요 버그좀 고쳐주세요 (예/ 아니오)",
    cardImage: "assets/photo_4.jpg",
    // envStatus: [
    //   EnvStatus(species: -10, seaLevel: -10, temper: -10, ozone: -10),
    //   EnvStatus(species: 10, seaLevel: 10, temper: 10, ozone: 10),
    // ],
  ),
  new PlanetCard(
    cardTitle: "종 +3 / 종 -3",
    cardText: "봄2번째 ",
    cardImage: "assets/photo_1.jpg",
    // envStatus: [
    //   EnvStatus(species: 3),
    //   EnvStatus(species: -3),
    // ],
  ),
  new PlanetCard(
    cardTitle: "해수면 -5 / 오존 +1, 기온 +1",
    cardText: "변화량 만드는거 레이아웃으로 만들어야겠다",
    cardImage: "assets/photo_2.jpg",
    // envStatus: [
    //   EnvStatus(seaLevel: -5),
    //   EnvStatus(ozone: 1, temper: 1),
    // ],
  ),
  new PlanetCard(
    cardTitle: "종 -10 / 기온 + 10",
    cardText: "변화량표시 그냥 클래스 갖다넣으면 화면에는 알아서 보여주게해야함",
    cardImage: "assets/photo_4.jpg",
    // envStatus: [
    //   EnvStatus(species: -10),
    //   EnvStatus(temper: 10),
    // ],
  ),
  new PlanetCard(
    cardTitle: "변화 X / 모두 + 5",
    cardText: "변화량 글자쓰는거 너무 귀찮아... 2번째 겨울",
    cardImage: "assets/photo_1.jpg",
    // envStatus: [
    //   EnvStatus(),
    //   EnvStatus(species: 5, seaLevel: 5, ozone: 5, temper: 5),
    // ],
  ),
];





// 이전 리포지토리의 PlanetCard과 같은 기능
class PlanetCard {
  String cardTitle;
  String cardText;
  String cardImage;
  double _topMargin;
  //TODO: add Env

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
    // this.topMargin
  });
  // }

  set topMargin(double topMargin){
    this._topMargin = topMargin;
  }

  get topMargin => _topMargin;

}