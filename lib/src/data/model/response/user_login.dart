import 'package:flutter_app_e_commerce/src/data/model/user.dart';

class UserLogin {
  String token;
  User user;

  UserLogin({required this.token, required this.user});

  factory UserLogin.fromJson(Map<String, dynamic> json) =>
      UserLogin(token: json["token"], user: User.fromJson(json["user"]));
}
