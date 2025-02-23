
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/core.dart';
import '../../../../shared/services/remote/dio/error_handler.dart';
import '../../../../utils/login_utils.dart';
import '../../domain/usecases/make_social_login_usecase.dart';
import '../../domain/usecases/make_user_login_usecase.dart';

enum LoginStatus { initial, loading, success, error }

class LoginState {
  final LoginStatus status;
  final String? msg;

  LoginState({
    this.status = LoginStatus.initial,
    this.msg,
  });

  LoginState copyWith({
    LoginStatus? status,
    String? msg,
  }) {
    return LoginState(
      status: status ?? this.status,
      msg: msg ?? this.msg,
    );
  }
}

final loginProvider = StateNotifierProvider<LoginProvider, LoginState>((ref) {
  final makeUserLoginUseCase = ref.read(makeUserLoginUseCaseProvider);
  final makeSocialLoginUseCase = ref.read(makeSocialLoginUseCaseProvider);
  return LoginProvider(makeUserLoginUseCase, makeSocialLoginUseCase);
});

class LoginProvider extends StateNotifier<LoginState> {
  final MakeUserLoginUseCase _makeUserLoginUseCase;
  final MakeSocialLoginUseCase _makeSocialLoginUseCase;

  LoginProvider(
    this._makeUserLoginUseCase,
    this._makeSocialLoginUseCase,
  ) : super(LoginState());

  void login(String phone, String password) async {
    state = state.copyWith(status: LoginStatus.loading);
    try {
      var result = await _makeUserLoginUseCase.execute(phone, password);
      state = state.copyWith(status: LoginStatus.success);
    } on ErrorHandler catch (e) {
      state = state.copyWith(status: LoginStatus.error, msg: e.toString());
    }
  }

  void socialLogin(String provider, String token) async {
    state = state.copyWith(status: LoginStatus.loading);
    try {
      var result = await _makeSocialLoginUseCase.execute(provider, token);
      state = state.copyWith(status: LoginStatus.success);
    } on ErrorHandler catch (e) {
      state = state.copyWith(status: LoginStatus.error, msg: e.toString());
    }
  }

  void googleLogin() async {
    try {
      var google = await LoginUtils().signInWithGoogle();
      Logger.log(msg: "token => ${google?.idToken}");
      var entity = await _makeSocialLoginUseCase.execute(
        'google',
        google?.idToken ?? '',
      );
      if (entity.token.isNotEmpty) state = state.copyWith(status: LoginStatus.success);
    } on ErrorHandler catch (e) {
      state = state.copyWith(status: LoginStatus.error, msg: e.getErrorMessage());
    } catch (e) {
      state = state.copyWith(status: LoginStatus.error, msg: e.toString());
    }
  }
}
