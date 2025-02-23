import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../shared/services/services.dart';
import '../entities/entities.dart';
import '../repositories/repositories.dart';

final makeUserLoginUseCaseProvider = Provider(
  (ref) => MakeUserLoginUseCase(ref.read(authRepositoryProvider)),
);

class MakeUserLoginUseCase {
  final AuthRepository _authRepository;

  MakeUserLoginUseCase(this._authRepository);

  Future<LoginEntity> execute(String phone, String password) async {
    try {
      var result = await _authRepository.userLogin(phone, password);
      return result;
    } on ErrorHandler catch (e) {
      rethrow;
    }
  }
}
