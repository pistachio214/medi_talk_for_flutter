import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:medi_talk_for_flutter/lang/const.dart';
import 'package:medi_talk_for_flutter/lang/routers.dart';
import 'package:medi_talk_for_flutter/router/global_router_key.dart';
import 'package:medi_talk_for_flutter/router/index.dart';
import 'package:medi_talk_for_flutter/utils/color_util.dart';
import 'package:medi_talk_for_flutter/utils/shared_preferences_util.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemUiOverlayStyle systemUiOverlayStyle = const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  );

  SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);

  SharedPreferencesUtil.getInstance().then((_) {
    runApp(const MediTalkApp());
  });
}

class MediTalkApp extends StatelessWidget {
  const MediTalkApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Const.defaultSystemName,
      theme: ThemeData(
        colorScheme: ColorScheme(
          //上方标题栏颜色
          primary: Const.defaultSystemThemeColor,
          secondary: Const.defaultSystemThemeColor,
          background: Const.defaultBarAndBodyThemColor,
          error: Colors.red,
          brightness: Brightness.light,
          onBackground: Colors.pink,
          onError: Colors.yellow,
          //字体颜色
          onPrimary: Const.defaultFontColor,
          onSecondary: Colors.redAccent,
          onSurface: Const.defaultSystemThemeColor,
          surface: Colors.redAccent,
        ),
      ),
      initialRoute: Routers.MAIN,
      onGenerateRoute: onGenerateRoute,
      navigatorKey: GlobalRouterKey.navigatorKey,
      builder: EasyLoading.init(),
    );
  }
}
