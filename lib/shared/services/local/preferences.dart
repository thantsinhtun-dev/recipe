
import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe/shared/extenstions/ext_encrypt.dart';
import 'package:shared_preferences/shared_preferences.dart';

final preferencesProvider = Provider((ref) => Preferences());

class Preferences {
  late SharedPreferences _prefs;
  final _accessToken = "access_token";
  final _loginInfo = "login_info";

  Preferences._private();

  static final _instance = Preferences._private();

  factory Preferences() {
    return _instance;
  }
  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  void saveAccessToken(String token) {
    _prefs.setString(_accessToken, "Bearer $token".aesEncrypt());
  }
  String getAccessToken() {
    return _prefs.getString(_accessToken)?.aesDecrypt() ?? "";
  }

  void clearData(){
    _prefs.clear();
  }
}
