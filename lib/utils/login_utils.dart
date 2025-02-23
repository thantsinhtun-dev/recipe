import 'package:google_sign_in/google_sign_in.dart';

class LoginUtils {
  Future<GoogleSignInAuthentication?> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    return googleAuth;
  }
}
