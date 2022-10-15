import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesUtil {
  static SharedPreferences preferences = {} as SharedPreferences;

  static Future<bool> getInstance() async {
    preferences = await SharedPreferences.getInstance();
    return true;
  }
}
