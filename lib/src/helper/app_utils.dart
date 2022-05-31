import 'dart:convert';

class AppUtils {
  String decodeBase64(String encoded) {
    String decoded = utf8.decode(base64.decode(encoded));
    return decoded;
  }

  static bool regexStr(String str, String pattern) {
    RegExp regExp = RegExp(
      pattern,
      caseSensitive: false,
      multiLine: false,
    );
    return regExp.hasMatch(str);
  }

  String decrypt() {
    return "";
  }
}
