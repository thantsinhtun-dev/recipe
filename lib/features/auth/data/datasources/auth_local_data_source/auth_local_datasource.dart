import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../shared/services/local/preferences.dart';
import '../../../domain/entities/entities.dart';
import '../datasources.dart';

final authLocalDataSource = Provider(
  (ref) => AuthLocalDataSourceImpl(ref.read(preferencesProvider)),
);

abstract class AuthLocalDataSource {
  void saveLoginInfo(LoginEntity entity);

  LoginEntity getLoginInfo();

  void saveToken(String token);

  String getToken();
}
