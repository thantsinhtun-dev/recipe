import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../shared/services/services.dart';
import '../models/models.dart';

final authApiService = Provider(
  (ref) => AuthApiService(dio: ref.read(dioProvider)),
);

class AuthApiService extends BaseApiService {
  AuthApiService({required super.dio});

  Future<LoginResponseModel> userLogin(String phone, String password) async {
    return await postServerCall(
      LoginResponseModel(),
      ApiConst.userLoginPath(phone: phone, password: password),
    );
  }

  Future<LoginResponseModel> socialLogin(String provider, String token) async {
    return await postServerCall(
      LoginResponseModel(),
      ApiConst.socialLoginPath,
      body: {
        "provider": provider,
        "id_token": token,
      },
    );
  }
}
