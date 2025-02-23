import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../../../../core/core.dart';
import '../../services.dart';

class TokenInterceptor extends Interceptor {
  List<Map<dynamic, dynamic>> failedRequests = [];
  bool isRefreshing = false;

  TokenInterceptor();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (Preferences().getAccessToken().isNotEmpty) {
      Logger.log(msg: "Token ${Preferences().getAccessToken()}");
      options.headers['Authorization'] = Preferences().getAccessToken();
    }
    options.headers['API-REQUEST-FROM'] = Platform.isIOS ? "IOS" : "Android";
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    handler.next(response);
  }

  /// Handle Error Response
  // @override
  // void onError(DioException err, ErrorInterceptorHandler handler) async {
  //   debugPrint(
  //       'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}, IS REFRESHING: ${isRefreshing.toString()}');
  //   if (err.response?.statusCode == 401) {
  //     if (!isRefreshing) {
  //       debugPrint("ACCESS TOKEN EXPIRED, GETTING NEW TOKEN PAIR");
  //       isRefreshing = true;
  //       await refreshToken(err, handler);
  //     } else {
  //       debugPrint("ADDING ERRRORED REQUEST TO FAILED QUEUE");
  //       failedRequests.add({'err': err, 'handler': handler});
  //     }
  //   } else {
  //     return handler.next(err);
  //   }
  // }
  //
  // FutureOr refreshToken(
  //     DioException err, ErrorInterceptorHandler handler) async {
  //   Dio retryDio = Dio(
  //     BaseOptions(
  //       baseUrl: ApiConst.baseUrl,
  //       headers: <String, String>{
  //         'Content-Type': 'application/json',
  //       },
  //     ),
  //   );
  //
  //   try {
  //     var response = await retryDio.post(
  //       '/v1/user/public/refresh_token',
  //       data: {"accessToken": Preferences().getRefreshToken()},
  //     );
  //     var parsedResponse = response.data;
  //
  //     if (response.statusCode == 401 || response.statusCode == 403) {
  //       // Handle logout for invalid refresh tokens
  //       debugPrint("LOGGING OUT: EXPIRED REFRESH TOKEN");
  //       return handler.reject(err);
  //     }
  //
  //     Preferences()
  //         .saveAccessToken(parsedResponse['data']['access_token'] ?? "");
  //     Preferences().saveExpiredTime(
  //         (parsedResponse['data']['expires_in'] ?? "0").toString());
  //
  //     isRefreshing = false;
  //
  //     debugPrint("RETRYING ${failedRequests.length} FAILED REQUEST(s)");
  //     retryRequests(parsedResponse['data']['access_token']);
  //   } catch (e) {
  //     // Handle cases like 400 Bad Request or other server errors
  //     debugPrint("REFRESH TOKEN FAILED: $e");
  //     isRefreshing = false;
  //     failedRequests = [];
  //     handler.reject(err); // Pass the original error back
  //   }
  // }
  //
  // Future retryRequests(token) async {
  //   Dio retryDio = Dio(
  //     BaseOptions(
  //       baseUrl: ApiConst.baseUrl,
  //       headers: <String, String>{
  //         'Content-Type': 'application/json',
  //       },
  //     ),
  //   );
  //
  //   for (var i = 0; i < failedRequests.length; i++) {
  //     debugPrint(
  //         'RETRYING[$i] => PATH: ${failedRequests[i]['err'].requestOptions.path}');
  //     RequestOptions requestOptions =
  //         failedRequests[i]['err'].requestOptions as RequestOptions;
  //     requestOptions.headers = {
  //       'Authorization': 'Bearer $token',
  //       'Content-Type': 'application/json'
  //     };
  //     await retryDio.fetch(requestOptions).then(
  //           failedRequests[i]['handler'].resolve,
  //           onError: (error) =>
  //               failedRequests[i]['handler'].reject(error as DioError),
  //         );
  //   }
  //   isRefreshing = false;
  //   failedRequests = [];
  // }
}
