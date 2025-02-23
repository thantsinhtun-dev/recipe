import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../shared/services/services.dart';
import '../entities/entities.dart';
import '../repositories/repositories.dart';

final makeSocialLoginUseCaseProvider = Provider(
  (ref) => MakeSocialLoginUseCase(ref.read(authRepositoryProvider)),
);

class MakeSocialLoginUseCase {
  final AuthRepository _authRepository;

  MakeSocialLoginUseCase(this._authRepository);

  Future<LoginEntity> execute(String provider, String token) async {
    try {
      var result = await _authRepository.socialLogin(provider, token);
      _authRepository.saveLogin(result);
      var entity = _authRepository.getLoginInfo();
      return result;
    } on ErrorHandler catch (e) {
      rethrow;
    }
  }
}
