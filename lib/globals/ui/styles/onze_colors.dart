import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';

class OnzeColors {
  static bool isDark =
      SchedulerBinding.instance.platformDispatcher.platformBrightness ==
          Brightness.dark;

  /// [Primary]
  static const Color primaryLightest = Color(0xffFFE2CE);
  static const Color primaryLight = Color(0xffFFA468);
  static const Color primaryRegular = Color(0xffFE6602);
  static const Color primaryDark = Color(0xffE45B00);
  static const Color primaryDarkest = Color(0xffAC4907);

  static const Color backgroundColor = Color(0xffFFFFFF);
  static const Color pink = Color(0xffE82068);
  static const Color pinkLight = Color(0xffFFE4EE);
  static const Color primaryDarkColor = Color(0xff1D9CA4);

  /// [Turquoise]
  static const Color turquoiseLightest = Color(0xffE2FDFF);
  static const Color turquoiseLight = Color(0xffB1E5E9);
  static const Color turquoiseRegular = Color(0xff80CDD2);
  static const Color turquoiseDark = Color(0xff4FB5BB);
  static const Color turquoiseDarkest = Color(0xff1D9CA4);

  /// [Grey]
  static const Color greyLightest = Color(0XffF4F4F4);
  static const Color greyLight = Color(0xffE8E8E8);
  static const Color greyRegular = Color(0xffD9D9D9);
  static const Color greyMedium = Color(0xff999999);
  static const Color greyDark = Color(0xff818181);
  static const Color greyDarkest = Color(0xff595959);

  /// [Purple]
  static const Color purpleDarkest = Color(0xff8252EB);
  static const Color purpleDark = Color(0xff9066EE);
  static const Color purpleRegular = Color(0xffBEA5F5);
  static const Color purpleLight = Color(0xffD6C7F9);
  static const Color purpleLightest = Color(0xffF2EDFD);

  /// [Orange]
  static const Color orangeStrong = Color(0xffFC846C);
  static const Color orangeLight = Color(0xffFFE2DC);

  /// [Amber]
  static const Color amberLightest = Color(0xffFFF4D9);
  static const Color amberLight = Color(0xffFCE3A3);
  static const Color amberRegular = Color(0xffF8D16D);
  static const Color amberDark = Color(0xffF5C037);
  static const Color amberDarkest = Color(0xffF1AE00);

  /// [Green]
  static const Color greenLightest = Color(0xffCDFAEA);
  static const Color greenLight = Color(0xff9AEACD);
  static const Color greenRegular = Color(0xff67D9B0);
  static const Color greenDark = Color(0xff34C993);
  static const Color greenDarkest = Color(0xff00B876);

  /// [Blue]
  static const Color blueDarkest = Color(0xff00A2FF);
  static const Color blueDark = Color(0xff1DADFF);
  static const Color blueRegular = Color(0xff7ED1FF);
  static const Color blueLight = Color(0xffAEE3FF);
  static const Color blueLightest = Color(0xffDEF4FF);

  /// [Red]
  static const Color redLightest = Color(0xffFFDDDB);
  static const Color redLight = Color(0xffFFC1BD);
  static const Color redRegular = Color(0xffFFA59F);
  static const Color redDark = Color(0xffFF8881);
  static const Color redDarkest = Color(0xffFF6B62);
}
