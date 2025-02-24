import 'package:dio/dio.dart';

import '../../domain/models/base_response_model.dart';


class BaseApiService {
  final Dio dio;

  BaseApiService({required this.dio});

  /// GET Request
  Future<T> getServerCall<T extends BaseResponseModel>(
    T obj,
    String url, {
    bool useHeaderToken = false,
    String? headerToken,
    Map<String, dynamic>? queryParameters = const {},
    Map<String, dynamic>? body = const {},
  }) async {
    try {
      final response = await dio.get(
        url,
        queryParameters: queryParameters,
        data: body,
      );
      if(response.data is List){
        return obj.fromJsonList(response.data);
      }
      return obj.fromJson(response.data);
    } on DioException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  /// POST Request
  Future<T> postServerCall<T extends BaseResponseModel>(
    T obj,
    String url, {
    bool useHeaderToken = false,
    String? headerToken,
    Map<String, dynamic>? body = const {},
    FormData? formData,
  }) async {
    try {
      final response = await dio.post(
        url,
        data: formData ?? body,
      );

      return obj.fromJson(response.data);
    } on DioException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  /// PUT Request
  Future<T> putServerCall<T extends BaseResponseModel>(
    T obj,
    String url, {
    bool useHeaderToken = false,
    String? headerToken,
    Map<String, dynamic>? body = const {},
  }) async {
    try {
      final response = await dio.put(
        url,
        data: body,
      );
      return obj.fromJson(response.data);
    } on DioException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  /// File Upload handle later
  // Future<R> uploadFile<T extends MasterApiReturnObject<dynamic>, R>(
  //   T obj,
  //   String url, {
  //   required String fileKey,
  //   required File file,
  //   Map<String, dynamic>? fields = const {},
  //   bool useHeaderToken = false,
  //   String? headerToken,
  // }) async {
  //   try {
  //     final options = Options(
  //       headers:
  //           useHeaderToken && headerToken != null ? {'Authorization': headerToken} : {},
  //     );
  //
  //     final formData = FormData.fromMap({
  //       ...fields!,
  //       fileKey: await MultipartFile.fromFile(
  //         file.path,
  //         filename: basename(file.path),
  //       ),
  //     });
  //
  //     final response = await dio.post(
  //       url,
  //       options: options,
  //       data: formData,
  //     );
  //
  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       final data = response.data;
  //       if (data is Map) {
  //         return obj.fromMap(data) as R;
  //       } else {
  //         throw Exception("Unexpected response type: ${data.runtimeType}");
  //       }
  //     } else {
  //       throw Exception(
  //           "Failed with status code: ${response.statusCode}, message: ${response.statusMessage}");
  //     }
  //   } on DioException {
  //     rethrow;
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  /// DELETE Request
  Future<T> deleteServerCall<T extends BaseResponseModel>(
    T obj,
    String url, {
    bool useHeaderToken = false,
    String? headerToken,
    Map<String, dynamic>? body = const {},
  }) async {
    try {
      final response = await dio.delete(
        url,
        data: body,
      );
      return obj.fromJson(response.data);
    } on DioException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
