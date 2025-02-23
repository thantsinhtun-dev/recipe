
import '../../../core/app_flavor.dart';

class ApiConst {
  static String get baseUrl => switch (AppFlavor.flavor) {
        Flavor.dev => "https://ezwel.live",
        Flavor.prod => "https://ezwel.live",
      };

  static String userLoginPath({
    String countryCode = "95",
    required String phone,
    required String password,
  }) {
    return "/appapi/service=Login.userLogin&country_code=$countryCode&user_login=$phone&user_pass=$password";
  }
  static String socialLoginPath = "/social/login";
}
