import 'dart:developer' as dev;
import 'package:flutter/foundation.dart';

class Logger {
  static log({String? functionName, required String msg}) {
    if (kDebugMode) dev.log("${functionName ?? ''}- $msg");
  }
}