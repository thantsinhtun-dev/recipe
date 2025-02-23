import '../../../../shared/services/services.dart';
import '../../domain/entities/entities.dart';
import '../../domain/repositories/repositories.dart';
import '../datasources/datasources.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthDataSource _authDataSource;
  final AuthLocalDataSource _authLocalDataSource;

  AuthRepositoryImpl(this._authDataSource, this._authLocalDataSource);

  @override
  Future<LoginEntity> socialLogin(String provider, String token) async {
    try {
      var result = await _authDataSource.socialLogin(provider, token);
      if (result.data?.info?.firstOrNull != null) {
        return result.data!.info!.firstOrNull!.toEntity();
      } else {
        throw ErrorHandler.otherException(result.data?.msg);
      }
    } on ErrorHandler catch (e) {
      rethrow;
    }
  }

  @override
  Future<LoginEntity> userLogin(String phone, String password) async {
    try {
      var result = await _authDataSource.userLogin(phone, password);
      if (result.data?.info?.firstOrNull != null) {
        return result.data!.info!.firstOrNull!.toEntity();
      } else {
        throw ErrorHandler.otherException(result.data?.msg);
      }
    } on ErrorHandler catch (e) {
      rethrow;
    }
  }

  @override
  void saveLogin(LoginEntity entity) {
    try {
      _authLocalDataSource.saveLoginInfo(entity);
    } on ErrorHandler catch (e) {
      rethrow;
    }
  }

  @override
  LoginEntity getLoginInfo() {
    try {
      return _authLocalDataSource.getLoginInfo();
    } on ErrorHandler catch (e) {
      rethrow;
    }
  }
}
