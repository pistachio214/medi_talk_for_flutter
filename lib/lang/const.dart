import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:medi_talk_for_flutter/utils/color_util.dart';

class Const {
  // 应用名称
  static const String defaultSystemName = "Meditalk";

  // IOS App Id
  static const String iosAppId = "xxxxxxxxxxxxxx";

  // Android App Id
  static const String androidAppId = "medi_talk";

  // 默认主题颜色
  static final Color defaultSystemThemeColor = ColorUtil.hexToColor("#1479FF");

  // 默认bar和背景颜色
  static final Color defaultBarAndBodyThemColor = ColorUtil.hexToColor("#D0E4FF");

  // 默认字体颜色
  static final Color defaultFontColor = ColorUtil.hexToColor("#193B68");

  // 默认logo
  static final Image defaultSystemLogo = Image.asset(
    "assets/images/logo.png",
    width: 100,
    fit: BoxFit.fitHeight,
  );

  static String defaultLoadingGif = "assets/images/loading.gif";

  static String defaultBaseUrl = 'http://192.168.0.208/api';

  static String defaultImageBaseUrl = "https://stationm.slyours.com";

  // 确定按钮的key
  static int okActionKey = 1;

  // 取消按钮的key
  static int cancelActionKey = 2;

  void _ss() {}
}
