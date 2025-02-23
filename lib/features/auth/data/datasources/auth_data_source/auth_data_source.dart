import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/login_response_model.dart';
import '../auth_api_service.dart';
import 'auth_data_source_impl.dart';

final authDataSource = Provider(
  (ref) => AuthDataSourceImpl(ref.read(authApiService)),
);

abstract class AuthDataSource {
  Future<LoginResponseModel> userLogin(String phone, String password);
  Future<LoginResponseModel> socialLogin(String provider, String token);
}
