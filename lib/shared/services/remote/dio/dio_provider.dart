import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../services.dart';


/// dio di with riverpod
final dioProvider = Provider<Dio>((ref) => DioProvider().init());

class DioProvider {
  Dio dio = Dio();

  /// for proxy-man
  String proxy = Platform.isAndroid ? '<YOUR_LOCAL_IP>:9090' : 'localhost:9090';

  Dio init() {
    if (kDebugMode) {
      final prettyDioLogger = PrettyDioLogger(
        request: true,
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        error: true,
        compact: true,
      );
      dio.interceptors.add(prettyDioLogger);
    }
    dio.options = BaseOptions(
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
      },
      baseUrl: ApiConst.baseUrl,
      queryParameters: {
        "apiKey" : "856a36732df0481eaa5d2413f7831413"
      }
    );
    dio.interceptors.add(TokenInterceptor());

    return dio;
  }
}
