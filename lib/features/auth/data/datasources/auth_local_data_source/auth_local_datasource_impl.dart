
import '../../../../../shared/services/services.dart';
import '../../../domain/entities/entities.dart';
import '../datasources.dart';

class AuthLocalDataSourceImpl extends AuthLocalDataSource {
  final Preferences _preferences;
  AuthLocalDataSourceImpl(this._preferences);
  @override
  String getToken() {
    return _preferences.getAccessToken();
  }

  @override
  void saveLoginInfo(LoginEntity entity) {
    _preferences.saveLoginInfo(entity);
    _preferences.saveAccessToken(entity.token);
  }

  @override
  void saveToken(String token) {
    _preferences.saveAccessToken(token);
  }

  @override
  LoginEntity getLoginInfo() {
    return _preferences.getLoginInfo();
  }

}