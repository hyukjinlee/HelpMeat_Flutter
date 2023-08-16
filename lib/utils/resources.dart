import 'package:flutter/material.dart';
import 'package:helpmeat/screens/arguments/grill_settings_arguments.dart';

/// App Theme 관련 상수
class AppThemes {
  static const Color mainPink = Color(0xFFE96D75);
  static const Color mainPink_40 = Color(0x66E96D75);
  static const Color screenBackGround = Color(0xFFF8E7F1);

  static const Radius radius = Radius.circular(20);
  static const Radius hard_radius = Radius.circular(40);
}

/// Resource Utils
class ResourceUtils {
  static String getMeatImagePath(MeatType meatType) {
    switch (meatType) {
      case MeatType.MEAT_TYPE_PORK:
        return 'assets/pork.png';
      case MeatType.MEAT_TYPE_BEEF:
        return 'assets/beef.png';
      default:
        return "";
    }
  }

  static String getMeatText(MeatType meatType) {
    switch (meatType) {
      case MeatType.MEAT_TYPE_PORK:
        return '돼지고기';
      case MeatType.MEAT_TYPE_BEEF:
        return '소고기';
      default:
        return "";
    }
  }

  static List<MeatInfo> getMeatPartInfoList(MeatType meatType) {
    switch (meatType) {
      case MeatType.MEAT_TYPE_BEEF:
        return <MeatInfo>[
          MeatInfo(name: "갈비살", meatPartType: MeatPartType.BEEF_PART_TYPE_GALBI, imagePath: 'assets/beef_galbi.png'),
          MeatInfo(name: "등심살", meatPartType: MeatPartType.BEEF_PART_TYPE_DEUNGSIM, imagePath: 'assets/beef_deungsim.png'),
          MeatInfo(name: "부채살", meatPartType: MeatPartType.BEEF_PART_TYPE_BUCHAE, imagePath: 'assets/beef_buchae.png'),
          MeatInfo(name: "살치살", meatPartType: MeatPartType.BEEF_PART_TYPE_SALCHI, imagePath: 'assets/beef_salchi.png'),
          MeatInfo(name: "안심", meatPartType: MeatPartType.BEEF_PART_TYPE_ANSIM, imagePath: 'assets/beef_ansim.png'),
          MeatInfo(name: "안창살", meatPartType: MeatPartType.BEEF_PART_TYPE_ANCHANG, imagePath: 'assets/beef_anchang.png'),
          MeatInfo(name: "제비추리", meatPartType: MeatPartType.BEEF_PART_TYPE_JEBICHURI, imagePath: 'assets/beef_jebichuri.png'),
          MeatInfo(name: "채끝살", meatPartType: MeatPartType.BEEF_PART_TYPE_CHAEKKEUT, imagePath: 'assets/beef_chaekkeut.png'),
          MeatInfo(name: "토시살", meatPartType: MeatPartType.BEEF_PART_TYPE_TOSI, imagePath: 'assets/beef_tosi.png'),];

      case MeatType.MEAT_TYPE_PORK:
        return <MeatInfo>[
          MeatInfo(name: "갈비살", meatPartType: MeatPartType.PORK_PART_TYPE_GALBI, imagePath: 'assets/pork_galbi.png'),
          MeatInfo(name: "갈매기살", meatPartType: MeatPartType.PORK_PART_TYPE_GALMAEGI, imagePath: 'assets/pork_galmaegi.png'),
          MeatInfo(name: "뒷다리살", meatPartType: MeatPartType.PORK_PART_TYPE_DUITDARI, imagePath: 'assets/pork_duitdari.png'),
          MeatInfo(name: "등심", meatPartType: MeatPartType.PORK_PART_TYPE_DEUNGSIM, imagePath: 'assets/pork_deungsim.png'),
          MeatInfo(name: "목살", meatPartType: MeatPartType.PORK_PART_TYPE_MOKSAL, imagePath: 'assets/pork_moksal.png'),
          MeatInfo(name: "안심", meatPartType: MeatPartType.PORK_PART_TYPE_ANSIM, imagePath: 'assets/pork_ansim.png'),
          MeatInfo(name: "앞다리살", meatPartType: MeatPartType.PORK_PART_TYPE_ABDARI, imagePath: 'assets/pork_abdari.png'),
          MeatInfo(name: "삼겹살", meatPartType: MeatPartType.PORK_PART_TYPE_SAMGYEUP, imagePath: 'assets/pork_samgyeup.png'),
          MeatInfo(name: "항정살", meatPartType: MeatPartType.PORK_PART_TYPE_HANGJEONG, imagePath: 'assets/pork_hangjeong.png'),];
      default:
        throw Exception();
    }
  }

  /// Thickness Screen
  static String getFirstStringByMeatThickness(double thickness) {
    if (thickness == 0.0){
      return '이제 화살표를 움직여';
    } else if (thickness <= 0.8) {
      return '입에서 사르르';
    } else if (thickness <= 1.5) {
      return '금방 구워지는';
    } else if (thickness <= 2.0) {
      return '호불호 안 갈리는';
    } else if (thickness <= 3.0) {
      return '식감이 살아있는';
    } else if (thickness <= 5.0) {
      return '육즙이 팡팡';
    }
    return "";
  }

  static String getCenterStringByMeatThickness(double thickness) {
    if (thickness == 0.0){
      return '';
    } else if (thickness <= 0.8) {
      return '"얇은"';
    } else if (thickness <= 1.5) {
      return '"조금 얇은"';
    } else if (thickness <= 2.0) {
      return '"보통 두께의"';
    } else if (thickness <= 3.0) {
      return '"조금 두꺼운"';
    } else if (thickness <= 5.0) {
      return '"두꺼운"';
    }
    return "";
  }

  static String getLastStringByMeatThickness(double thickness) {
    if (thickness == 0.0){
      return '두께(\u21D5)를 측정해주세요';
    } else if (thickness <= 5.0) {
      return '고기네요';
    }
    return "";
  }

  /// Doneness Screen
  static List<DonenessInfo> getDonenessInfoList(MeatType meatType) {
    switch (meatType) {
      case MeatType.MEAT_TYPE_BEEF:
        return <DonenessInfo>[
          DonenessInfo(name: "RARE", donenessType: DonenessType.RARE, imagePath: 'assets/beef.png'),
          DonenessInfo(name: "MEDIUM RARE", donenessType: DonenessType.MEDIUM_RARE, imagePath: 'assets/beef_medium_rare.png'),
          DonenessInfo(name: "MEDIUM", donenessType: DonenessType.MEDIUM, imagePath: 'assets/beef_medium.png'),
          DonenessInfo(name: "MEDIUM WELLDONE", donenessType: DonenessType.MEDIUM, imagePath: 'assets/beef_medium.png'),
          DonenessInfo(name: "WELLDONE", donenessType: DonenessType.WELLDONE, imagePath: 'assets/beef_well_done.png'),
        ];

      case MeatType.MEAT_TYPE_PORK:
        return <DonenessInfo>[
          DonenessInfo(name: "RARE", donenessType: DonenessType.RARE, imagePath: 'assets/pork.png'),
          DonenessInfo(name: "MEDIUM", donenessType: DonenessType.MEDIUM, imagePath: 'assets/pork_medium.png'),
          DonenessInfo(name: "WELL DONE", donenessType: DonenessType.WELLDONE, imagePath: 'assets/pork_well_done.png'),
        ];
      default:
        throw Exception();
    }
  }

  /// Fire Screen
  static List<FireInfo> getFireInfoList() {
    return <FireInfo>[
      FireInfo(name: "연탄", fireType: FireType.BRIQUETTE, imagePath: 'assets/briquette.png'),
      FireInfo(name: "숯불", fireType: FireType.CHARCOAL, imagePath: 'assets/charcoal.png'),
      FireInfo(name: "버너", fireType: FireType.GAS_STOVE, imagePath: 'assets/gas_stove.png'),
      FireInfo(name: "인덕션", fireType: FireType.INDUCTION, imagePath: 'assets/induction.png'),
      FireInfo(name: "전기 그릴", fireType: FireType.ELECTRIC_GRILL, imagePath: 'assets/electric_grill.png'),
    ];
  }

  /// Griddle Screen
  static List<GriddleInfo> getGriddleInfoList(FireType fireType) {
    switch (fireType) {
      case FireType.BRIQUETTE:
      case FireType.CHARCOAL:
        return <GriddleInfo>[
          GriddleInfo(name: "솥뚜껑", griddleType: GriddleType.CALDRON_LID, imagePath: 'assets/caldron_lid.png'),
          GriddleInfo(name: "코팅 불판", griddleType: GriddleType.COATING_GRIDDLE, imagePath: 'assets/coating_griddle.png'),
          GriddleInfo(name: "석쇠", griddleType: GriddleType.GRIDIRON, imagePath: 'assets/gridiron.png'),
        ];
      case FireType.GAS_STOVE:
        return <GriddleInfo>[
          GriddleInfo(name: "솥뚜껑", griddleType: GriddleType.CALDRON_LID, imagePath: 'assets/caldron_lid.png'),
          GriddleInfo(name: "코팅 불판", griddleType: GriddleType.COATING_GRIDDLE, imagePath: 'assets/coating_griddle.png'),
          GriddleInfo(name: "프라이팬", griddleType: GriddleType.FRYING_PAN, imagePath: 'assets/frying_pan.png'),
        ];
      case FireType.INDUCTION:
        return <GriddleInfo>[
          GriddleInfo(name: "프라이팬", griddleType: GriddleType.FRYING_PAN, imagePath: 'assets/frying_pan.png'),
        ];
      case FireType.ELECTRIC_GRILL:
        return <GriddleInfo>[
          GriddleInfo(name: "전기그릴", griddleType: GriddleType.ELECTRIC_GRILL, imagePath: 'assets/electric_grill.png'),
        ];
    }
  }
}