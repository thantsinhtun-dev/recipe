import 'package:encrypt/encrypt.dart';

const ENCRYPT_KEY = "ezliveninepurple";



extension StringExtension on String {

  String aesEncrypt() {
    final key = Key.fromUtf8(ENCRYPT_KEY);
    final iv = IV.fromUtf8("ENCRYPT_KEY");

    final enCry = Encrypter(AES(key));
    final encrypted = enCry.encrypt(this, iv: iv);

    return encrypted.base64;
  }

  String aesDecrypt() {
    final key = Key.fromUtf8(ENCRYPT_KEY);
    final iv = IV.fromUtf8("ENCRYPT_KEY");

    final enCry = Encrypter(AES(key));
    final decrypted = enCry.decrypt(Encrypted.from64(this), iv: iv);

    return decrypted;
  }
}