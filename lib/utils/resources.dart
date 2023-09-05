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

class Constants {
  static const String GRILL_SETTINGS_RESOURCES_PATH = 'assets/grillSettings/';
  static const String GRILL_PROCESS_RESOURCES_PATH = 'assets/grillProcess/';
}

/// Resource Utils
class ResourceUtils {
  static String getMeatImagePath(MeatType meatType) {
    switch (meatType) {
      case MeatType.MEAT_TYPE_PORK:
        return '${Constants.GRILL_SETTINGS_RESOURCES_PATH}pork.png';
      case MeatType.MEAT_TYPE_BEEF:
        return '${Constants.GRILL_SETTINGS_RESOURCES_PATH}beef.png';
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
          MeatInfo(name: "갈비살", meatPartType: MeatPartType.BEEF_PART_TYPE_GALBI, imagePath: '${Constants.GRILL_SETTINGS_RESOURCES_PATH}beef_galbi.png'),
          MeatInfo(name: "등심살", meatPartType: MeatPartType.BEEF_PART_TYPE_DEUNGSIM, imagePath: '${Constants.GRILL_SETTINGS_RESOURCES_PATH}beef_deungsim.png'),
          MeatInfo(name: "부채살", meatPartType: MeatPartType.BEEF_PART_TYPE_BUCHAE, imagePath: '${Constants.GRILL_SETTINGS_RESOURCES_PATH}beef_buchae.png'),
          MeatInfo(name: "살치살", meatPartType: MeatPartType.BEEF_PART_TYPE_SALCHI, imagePath: '${Constants.GRILL_SETTINGS_RESOURCES_PATH}beef_salchi.png'),
          MeatInfo(name: "안심", meatPartType: MeatPartType.BEEF_PART_TYPE_ANSIM, imagePath: '${Constants.GRILL_SETTINGS_RESOURCES_PATH}beef_ansim.png'),
          MeatInfo(name: "안창살", meatPartType: MeatPartType.BEEF_PART_TYPE_ANCHANG, imagePath: '${Constants.GRILL_SETTINGS_RESOURCES_PATH}beef_anchang.png'),
          MeatInfo(name: "제비추리", meatPartType: MeatPartType.BEEF_PART_TYPE_JEBICHURI, imagePath: '${Constants.GRILL_SETTINGS_RESOURCES_PATH}beef_jebichuri.png'),
          MeatInfo(name: "채끝살", meatPartType: MeatPartType.BEEF_PART_TYPE_CHAEKKEUT, imagePath: '${Constants.GRILL_SETTINGS_RESOURCES_PATH}beef_chaekkeut.png'),
          MeatInfo(name: "토시살", meatPartType: MeatPartType.BEEF_PART_TYPE_TOSI, imagePath: '${Constants.GRILL_SETTINGS_RESOURCES_PATH}beef_tosi.png'),];

      case MeatType.MEAT_TYPE_PORK:
        return <MeatInfo>[
          MeatInfo(name: "갈비살", meatPartType: MeatPartType.PORK_PART_TYPE_GALBI, imagePath: '${Constants.GRILL_SETTINGS_RESOURCES_PATH}pork_galbi.png'),
          MeatInfo(name: "갈매기살", meatPartType: MeatPartType.PORK_PART_TYPE_GALMAEGI, imagePath: '${Constants.GRILL_SETTINGS_RESOURCES_PATH}pork_galmaegi.png'),
          MeatInfo(name: "뒷다리살", meatPartType: MeatPartType.PORK_PART_TYPE_DUITDARI, imagePath: '${Constants.GRILL_SETTINGS_RESOURCES_PATH}pork_duitdari.png'),
          MeatInfo(name: "등심", meatPartType: MeatPartType.PORK_PART_TYPE_DEUNGSIM, imagePath: '${Constants.GRILL_SETTINGS_RESOURCES_PATH}pork_deungsim.png'),
          MeatInfo(name: "목살", meatPartType: MeatPartType.PORK_PART_TYPE_MOKSAL, imagePath: '${Constants.GRILL_SETTINGS_RESOURCES_PATH}pork_moksal.png'),
          MeatInfo(name: "안심", meatPartType: MeatPartType.PORK_PART_TYPE_ANSIM, imagePath: '${Constants.GRILL_SETTINGS_RESOURCES_PATH}pork_ansim.png'),
          MeatInfo(name: "앞다리살", meatPartType: MeatPartType.PORK_PART_TYPE_ABDARI, imagePath: '${Constants.GRILL_SETTINGS_RESOURCES_PATH}pork_abdari.png'),
          MeatInfo(name: "삼겹살", meatPartType: MeatPartType.PORK_PART_TYPE_SAMGYEUP, imagePath: '${Constants.GRILL_SETTINGS_RESOURCES_PATH}pork_samgyeup.png'),
          MeatInfo(name: "항정살", meatPartType: MeatPartType.PORK_PART_TYPE_HANGJEONG, imagePath: '${Constants.GRILL_SETTINGS_RESOURCES_PATH}pork_hangjeong.png'),];
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
          DonenessInfo(name: "RARE", donenessType: DonenessType.RARE, imagePath: '${Constants.GRILL_SETTINGS_RESOURCES_PATH}beef.png'),
          DonenessInfo(name: "MEDIUM RARE", donenessType: DonenessType.MEDIUM_RARE, imagePath: '${Constants.GRILL_SETTINGS_RESOURCES_PATH}beef_medium_rare.png'),
          DonenessInfo(name: "MEDIUM", donenessType: DonenessType.MEDIUM, imagePath: '${Constants.GRILL_SETTINGS_RESOURCES_PATH}beef_medium.png'),
          DonenessInfo(name: "MEDIUM WELLDONE", donenessType: DonenessType.MEDIUM, imagePath: '${Constants.GRILL_SETTINGS_RESOURCES_PATH}beef_medium_well_done.png'),
          DonenessInfo(name: "WELLDONE", donenessType: DonenessType.WELLDONE, imagePath: '${Constants.GRILL_SETTINGS_RESOURCES_PATH}beef_well_done.png'),
        ];

      case MeatType.MEAT_TYPE_PORK:
        return <DonenessInfo>[
          DonenessInfo(name: "RARE", donenessType: DonenessType.RARE, imagePath: '${Constants.GRILL_SETTINGS_RESOURCES_PATH}pork.png'),
          DonenessInfo(name: "MEDIUM RARE", donenessType: DonenessType.MEDIUM_RARE, imagePath: '${Constants.GRILL_SETTINGS_RESOURCES_PATH}pork_medium_rare.png'),
          DonenessInfo(name: "MEDIUM", donenessType: DonenessType.MEDIUM, imagePath: '${Constants.GRILL_SETTINGS_RESOURCES_PATH}pork_medium.png'),
          DonenessInfo(name: "MEDIUM WELLDONE", donenessType: DonenessType.MEDIUM, imagePath: '${Constants.GRILL_SETTINGS_RESOURCES_PATH}pork_medium_well_done.png'),
          DonenessInfo(name: "WELL DONE", donenessType: DonenessType.WELLDONE, imagePath: '${Constants.GRILL_SETTINGS_RESOURCES_PATH}pork_well_done.png'),
        ];
      default:
        throw Exception();
    }
  }

  /// Fire Screen
  static List<FireInfo> getFireInfoList() {
    return <FireInfo>[
      FireInfo(name: "연탄", fireType: FireType.BRIQUETTE, imagePath: '${Constants.GRILL_SETTINGS_RESOURCES_PATH}briquette.png'),
      FireInfo(name: "숯불", fireType: FireType.CHARCOAL, imagePath: '${Constants.GRILL_SETTINGS_RESOURCES_PATH}charcoal.png'),
      FireInfo(name: "버너", fireType: FireType.GAS_STOVE, imagePath: '${Constants.GRILL_SETTINGS_RESOURCES_PATH}gas_stove.png'),
      FireInfo(name: "인덕션", fireType: FireType.INDUCTION, imagePath: '${Constants.GRILL_SETTINGS_RESOURCES_PATH}induction.png'),
      FireInfo(name: "전기 그릴", fireType: FireType.ELECTRIC_GRILL, imagePath: '${Constants.GRILL_SETTINGS_RESOURCES_PATH}electric_grill.png'),
    ];
  }

  /// Griddle Screen
  static List<GriddleInfo> getGriddleInfoList(FireType fireType) {
    switch (fireType) {
      case FireType.BRIQUETTE:
      case FireType.CHARCOAL:
        return <GriddleInfo>[
          GriddleInfo(name: "솥뚜껑", griddleType: GriddleType.CALDRON_LID, imagePath: '${Constants.GRILL_SETTINGS_RESOURCES_PATH}caldron_lid.png'),
          GriddleInfo(name: "코팅 불판", griddleType: GriddleType.COATING_GRIDDLE, imagePath: '${Constants.GRILL_SETTINGS_RESOURCES_PATH}coating_griddle.png'),
          GriddleInfo(name: "석쇠", griddleType: GriddleType.GRIDIRON, imagePath: '${Constants.GRILL_SETTINGS_RESOURCES_PATH}gridiron.png'),
        ];
      case FireType.GAS_STOVE:
        return <GriddleInfo>[
          GriddleInfo(name: "솥뚜껑", griddleType: GriddleType.CALDRON_LID, imagePath: '${Constants.GRILL_SETTINGS_RESOURCES_PATH}caldron_lid.png'),
          GriddleInfo(name: "코팅 불판", griddleType: GriddleType.COATING_GRIDDLE, imagePath: '${Constants.GRILL_SETTINGS_RESOURCES_PATH}coating_griddle.png'),
          GriddleInfo(name: "프라이팬", griddleType: GriddleType.FRYING_PAN, imagePath: '${Constants.GRILL_SETTINGS_RESOURCES_PATH}frying_pan.png'),
        ];
      case FireType.INDUCTION:
        return <GriddleInfo>[
          GriddleInfo(name: "프라이팬", griddleType: GriddleType.FRYING_PAN, imagePath: '${Constants.GRILL_SETTINGS_RESOURCES_PATH}frying_pan.png'),
        ];
      case FireType.ELECTRIC_GRILL:
        return <GriddleInfo>[
          GriddleInfo(name: "전기그릴", griddleType: GriddleType.ELECTRIC_GRILL, imagePath: '${Constants.GRILL_SETTINGS_RESOURCES_PATH}electric_grill.png'),
        ];
    }
  }

  /// Finish Settings Screen
  static String getFinishSettingsImagePath(MeatType meatType, GriddleType griddleType) {
    switch (meatType) {
    // 소고기
      case MeatType.MEAT_TYPE_BEEF:
        switch (griddleType) {
          case GriddleType.ELECTRIC_GRILL:
            return '${Constants.GRILL_SETTINGS_RESOURCES_PATH}beef_complete_electric_grill.png';
          case GriddleType.GRIDIRON:
            return '${Constants.GRILL_SETTINGS_RESOURCES_PATH}beef_complete_gridiron.png';
          case GriddleType.FRYING_PAN:
            return '${Constants.GRILL_SETTINGS_RESOURCES_PATH}beef_complete_frying_pan.png';
          case GriddleType.COATING_GRIDDLE:
            return '${Constants.GRILL_SETTINGS_RESOURCES_PATH}beef_complete_coating_griddle.png';
          case GriddleType.CALDRON_LID:
            return '${Constants.GRILL_SETTINGS_RESOURCES_PATH}beef_complete_caldron_lid.png';
        }

    // 돼지고기
      case MeatType.MEAT_TYPE_PORK:
        switch (griddleType) {
          case GriddleType.ELECTRIC_GRILL:
            return '${Constants.GRILL_SETTINGS_RESOURCES_PATH}pork_complete_electric_grill.png';
          case GriddleType.GRIDIRON:
            return '${Constants.GRILL_SETTINGS_RESOURCES_PATH}pork_complete_gridiron.png';
          case GriddleType.FRYING_PAN:
            return '${Constants.GRILL_SETTINGS_RESOURCES_PATH}pork_complete_frying_pan.png';
          case GriddleType.COATING_GRIDDLE:
            return '${Constants.GRILL_SETTINGS_RESOURCES_PATH}pork_complete_coating_griddle.png';
          case GriddleType.CALDRON_LID:
            return '${Constants.GRILL_SETTINGS_RESOURCES_PATH}pork_complete_caldron_lid.png';
        }
    }
  }

  /// Grill Process Screen
  static String getStartStateImagePath(MeatType meatType, GriddleType griddleType) {
    switch (meatType) {
      case MeatType.MEAT_TYPE_BEEF:
        switch (griddleType) {
          case GriddleType.ELECTRIC_GRILL:
            return '${Constants.GRILL_PROCESS_RESOURCES_PATH}beef_electric_grill_start.png';
          case GriddleType.GRIDIRON:
            return '${Constants.GRILL_PROCESS_RESOURCES_PATH}beef_gridiron_start.png';
          case GriddleType.FRYING_PAN:
            return '${Constants.GRILL_PROCESS_RESOURCES_PATH}beef_frying_pan_start.png';
          case GriddleType.COATING_GRIDDLE:
            return '${Constants.GRILL_PROCESS_RESOURCES_PATH}beef_coating_griddle_start.png';
          case GriddleType.CALDRON_LID:
            return '${Constants.GRILL_PROCESS_RESOURCES_PATH}beef_caldron_lid_start.png';
        }
      case MeatType.MEAT_TYPE_PORK:
        switch (griddleType) {
          case GriddleType.ELECTRIC_GRILL:
            return '${Constants.GRILL_PROCESS_RESOURCES_PATH}pork_electric_grill_start.png';
          case GriddleType.GRIDIRON:
            return '${Constants.GRILL_PROCESS_RESOURCES_PATH}pork_gridiron_start.png';
          case GriddleType.FRYING_PAN:
            return '${Constants.GRILL_PROCESS_RESOURCES_PATH}pork_frying_pan_start.png';
          case GriddleType.COATING_GRIDDLE:
            return '${Constants.GRILL_PROCESS_RESOURCES_PATH}pork_coating_griddle_start.png';
          case GriddleType.CALDRON_LID:
            return '${Constants.GRILL_PROCESS_RESOURCES_PATH}pork_caldron_lid_start.png';
        }
    }
  }

  static String getTimerStateImagePath(MeatType meatType, GriddleType griddleType) {
    switch (meatType) {
      case MeatType.MEAT_TYPE_BEEF:
        switch (griddleType) {
          case GriddleType.ELECTRIC_GRILL:
            return '${Constants.GRILL_PROCESS_RESOURCES_PATH}beef_electric_grill_timer.png';
          case GriddleType.GRIDIRON:
            return '${Constants.GRILL_PROCESS_RESOURCES_PATH}beef_gridiron_timer.png';
          case GriddleType.FRYING_PAN:
            return '${Constants.GRILL_PROCESS_RESOURCES_PATH}beef_frying_pan_timer.png';
          case GriddleType.COATING_GRIDDLE:
            return '${Constants.GRILL_PROCESS_RESOURCES_PATH}beef_coating_griddle_timer.png';
          case GriddleType.CALDRON_LID:
            return '${Constants.GRILL_PROCESS_RESOURCES_PATH}beef_caldron_lid_timer.png';
        }
      case MeatType.MEAT_TYPE_PORK:
        switch (griddleType) {
          case GriddleType.ELECTRIC_GRILL:
            return '${Constants.GRILL_PROCESS_RESOURCES_PATH}pork_electric_grill_timer.png';
          case GriddleType.GRIDIRON:
            return '${Constants.GRILL_PROCESS_RESOURCES_PATH}pork_gridiron_timer.png';
          case GriddleType.FRYING_PAN:
            return '${Constants.GRILL_PROCESS_RESOURCES_PATH}pork_frying_pan_timer.png';
          case GriddleType.COATING_GRIDDLE:
            return '${Constants.GRILL_PROCESS_RESOURCES_PATH}pork_coating_griddle_timer.png';
          case GriddleType.CALDRON_LID:
            return '${Constants.GRILL_PROCESS_RESOURCES_PATH}pork_caldron_lid_timer.png';
        }
    }
  }

  static String getFinishStateImagePath(MeatType meatType, GriddleType griddleType) {
    switch (meatType) {
      case MeatType.MEAT_TYPE_BEEF:
        switch (griddleType) {
          case GriddleType.ELECTRIC_GRILL:
            return '${Constants.GRILL_PROCESS_RESOURCES_PATH}beef_electric_grill_finish.png';
          case GriddleType.GRIDIRON:
            return '${Constants.GRILL_PROCESS_RESOURCES_PATH}beef_gridiron_finish.png';
          case GriddleType.FRYING_PAN:
            return '${Constants.GRILL_PROCESS_RESOURCES_PATH}beef_frying_pan_finish.png';
          case GriddleType.COATING_GRIDDLE:
            return '${Constants.GRILL_PROCESS_RESOURCES_PATH}beef_coating_griddle_finish.png';
          case GriddleType.CALDRON_LID:
            return '${Constants.GRILL_PROCESS_RESOURCES_PATH}beef_caldron_lid_finish.png';
        }
      case MeatType.MEAT_TYPE_PORK:
        switch (griddleType) {
          case GriddleType.ELECTRIC_GRILL:
            return '${Constants.GRILL_PROCESS_RESOURCES_PATH}pork_electric_grill_finish.png';
          case GriddleType.GRIDIRON:
            return '${Constants.GRILL_PROCESS_RESOURCES_PATH}pork_gridiron_finish.png';
          case GriddleType.FRYING_PAN:
            return '${Constants.GRILL_PROCESS_RESOURCES_PATH}pork_frying_pan_finish.png';
          case GriddleType.COATING_GRIDDLE:
            return '${Constants.GRILL_PROCESS_RESOURCES_PATH}pork_coating_griddle_finish.png';
          case GriddleType.CALDRON_LID:
            return '${Constants.GRILL_PROCESS_RESOURCES_PATH}pork_caldron_lid_finish.png';
        }
    }
  }

  static String getTurnOverStateImagePath(MeatType meatType) {
    switch (meatType) {
      case MeatType.MEAT_TYPE_BEEF:
        return '${Constants.GRILL_PROCESS_RESOURCES_PATH}beef_turn_over.png';
      case MeatType.MEAT_TYPE_PORK:
        return '${Constants.GRILL_PROCESS_RESOURCES_PATH}pork_turn_over.png';
    }
  }

  static String getTurnOverWithCuttingStateImagePath(MeatType meatType) {
    switch (meatType) {
      case MeatType.MEAT_TYPE_BEEF:
        return '${Constants.GRILL_PROCESS_RESOURCES_PATH}beef_turn_over_with_cutting.png';
      case MeatType.MEAT_TYPE_PORK:
        return '${Constants.GRILL_PROCESS_RESOURCES_PATH}pork_turn_over_with_cutting.png';
    }
  }
}