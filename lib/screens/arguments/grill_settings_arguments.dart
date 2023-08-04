
class Arguments {

}

class GrillSettingsArguments extends Arguments {
  MeatType meatType;
  MeatPartType? meatPartType;
  double? thickness;
  DonenessType? donenessType;

  // 생성자
  GrillSettingsArguments(this.meatType);
}

enum MeatType {
  MEAT_TYPE_FORK,
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

  FORK_PART_TYPE_ABDARI,
  FORK_PART_TYPE_ANSIM,
  FORK_PART_TYPE_DEUNGSIM,
  FORK_PART_TYPE_DUITDARI,
  FORK_PART_TYPE_GALBI,
  FORK_PART_TYPE_GALMAEGI,
  FORK_PART_TYPE_HANGJEONG,
  FORK_PART_TYPE_MOKSAL,
  FORK_PART_TYPE_SAMGYEUP,
}

enum DonenessType {
  RARE,
  MEDIUM_RARE,
  MEDIUM,
  WELLDONE,
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