import 'dart:developer';

import 'package:flutter/foundation.dart';

class LogsUtil {
  static void info(String message) {
    if (kDebugMode) {
      log(message);
    }
  }
}
