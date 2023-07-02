
class Arguments {

}

class GrillMeatArguments extends Arguments {
  MeatType meatType;
  MeatInfo? meatInfoDetail;
  double? thickness;

  // 생성자
  GrillMeatArguments(this.meatType);
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

class MeatInfo {
  final String name;
  final MeatPartType meatPartType;

  const MeatInfo(
      { required this.name,
        required this.meatPartType,});
}