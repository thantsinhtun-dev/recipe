import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/datasources/datasources.dart';
import '../../data/repositories/repositories.dart';
import '../entities/entities.dart';

final authRepositoryProvider = Provider(
  (ref) => AuthRepositoryImpl(ref.read(authDataSource),ref.read(authLocalDataSource)),
);

abstract class AuthRepository {
  Future<LoginEntity> userLogin(String phone, String password);
  Future<LoginEntity> socialLogin(String provider, String token);
  void saveLogin(LoginEntity entity);
  LoginEntity getLoginInfo();
}
