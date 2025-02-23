import 'package:dio/dio.dart';

import '../../../../../shared/services/services.dart';
import '../../models/login_response_model.dart';
import '../auth_api_service.dart';
import 'auth_data_source.dart';

class AuthDataSourceImpl extends AuthDataSource {
  final AuthApiService _authApiService;

  AuthDataSourceImpl(this._authApiService);

  @override
  Future<LoginResponseModel> socialLogin(String provider, String token) async {
    try {
      var result = await _authApiService.socialLogin(provider, token);
      if(result.data?.msg?.isNotEmpty == true){
        throw ErrorHandler.otherException(result.data?.msg);
      }else {
        return result;
      }
    } on DioException catch (e) {
      throw ErrorHandler.dioException(error: e);
    } catch (e) {
      throw ErrorHandler.otherException(e.toString());
    }
  }

  @override
  Future<LoginResponseModel> userLogin(String phone, String password) async {
    try {
      var result = await _authApiService.userLogin(phone, password);
      if(result.data?.msg?.isNotEmpty == true){
        throw ErrorHandler.otherException(result.data?.msg);
      }else {
        return result;
      }
    } on DioException catch (e) {
      throw ErrorHandler.dioException(error: e);
    } catch (e) {
      throw ErrorHandler.otherException(e.toString());
    }
  }
}
