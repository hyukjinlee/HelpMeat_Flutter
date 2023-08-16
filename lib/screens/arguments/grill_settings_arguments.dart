
class Arguments {

}

class GrillSettingsArguments extends Arguments {
  MeatType meatType;
  MeatInfo? meatInfo;
  double? thickness;
  DonenessInfo? donenessInfo;
  FireInfo? fireInfo;
  GriddleInfo? griddleInfo;

  // 생성자
  GrillSettingsArguments(this.meatType);
}

enum MeatType {
  MEAT_TYPE_PORK,
  MEAT_TYPE_BEEF,
}

enum MeatPartType {
  BEEF_PART_TYPE_ANCHANG,
  BEEF_PART_TYPE_ANSIM,
  BEEF_PART_TYPE_BUCHAE,
  BEEF_PART_TYPE_CHAEKKEUT,
  BEEF_PART_TYPE_DEUNGSIM,
  BEEF_PART_TYPE_GALBI,
  BEEF_PART_TYPE_JEBICHURI,
  BEEF_PART_TYPE_SALCHI,
  BEEF_PART_TYPE_TOSI,

  PORK_PART_TYPE_ABDARI,
  PORK_PART_TYPE_ANSIM,
  PORK_PART_TYPE_DEUNGSIM,
  PORK_PART_TYPE_DUITDARI,
  PORK_PART_TYPE_GALBI,
  PORK_PART_TYPE_GALMAEGI,
  PORK_PART_TYPE_HANGJEONG,
  PORK_PART_TYPE_MOKSAL,
  PORK_PART_TYPE_SAMGYEUP,
}

enum DonenessType {
  RARE,
  MEDIUM_RARE,
  MEDIUM,
  MEDIUM_WELLDONE,
  WELLDONE,
}

enum FireType {
  BRIQUETTE, // 연탄
  CHARCOAL, // 숯
  GAS_STOVE, // 가스레인지
  INDUCTION, // 인덕션
  ELECTRIC_GRILL, // 전기 그릴
}

enum GriddleType {
  CALDRON_LID, // 솥뚜껑
  COATING_GRIDDLE, // 코팅 불판
  FRYING_PAN, // 프라이팬
  GRIDIRON, // 석쇠
  ELECTRIC_GRILL, // 전기 그릴
}

class GrillSettingsInfo {
  final String name;
  final String imagePath;

  const GrillSettingsInfo(
      { required this.name,
        required this.imagePath});
}

class MeatInfo extends GrillSettingsInfo {
  final MeatPartType meatPartType;

  const MeatInfo(
      { required name,
        required this.meatPartType,
        required imagePath}) : super(name: name, imagePath: imagePath);
}

class DonenessInfo extends GrillSettingsInfo {
  final DonenessType donenessType;

  const DonenessInfo(
      { required name,
        required this.donenessType,
        required imagePath}) : super(name: name, imagePath: imagePath);
}

class FireInfo extends GrillSettingsInfo {
  final FireType fireType;

  const FireInfo(
      { required name,
        required this.fireType,
        required imagePath}) : super(name: name, imagePath: imagePath);
}

class GriddleInfo extends GrillSettingsInfo {
  final GriddleType griddleType;

  const GriddleInfo(
      { required name,
        required this.griddleType,
        required imagePath}) : super(name: name, imagePath: imagePath);
}