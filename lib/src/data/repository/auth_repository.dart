import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app_e_commerce/src/data/model/request/login_request.dart';
import 'package:flutter_app_e_commerce/src/data/model/request/register_request.dart';

abstract class AuthRepository{

  Future<void> openApp();

  Future<void> signUp(RegisterRequest request);

  Future<void> login(LoginRequest request);

  Future<void> logout();

}