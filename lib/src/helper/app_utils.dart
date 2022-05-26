import 'dart:convert';

class AppUtils{

  String decodeBase64(String encoded){
    String decoded = utf8.decode(base64.decode(encoded));
    return decoded;
  }

  String decrypt(){
    return "";
  }
}