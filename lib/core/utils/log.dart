import 'package:flutter/foundation.dart';

class Log {
  static debug(object){
    if (kDebugMode) {
      print(object);
    }
  }
}