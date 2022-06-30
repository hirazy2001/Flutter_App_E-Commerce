import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter_app_e_commerce/src/common/locator.dart';
import 'package:flutter_app_e_commerce/src/config/api_strategy.dart';
import 'package:flutter_app_e_commerce/src/data/model/request/register_request.dart';
import 'package:flutter_app_e_commerce/src/data/repository/auth_repository.dart';

import '../model/request/login_request.dart';

class AuthRepositoryImpl extends AuthRepository{

  ApiStrategy apiStrategy = locator<ApiStrategy>();

  @override
  Future<void> login(LoginRequest request) async{
    // apiStrategy.request()
  }

  @override
  Future<void> logout() async{
    await FirebaseAuth.instance.signOut();
  }

  @override
  Future<void> openApp() async{
    throw UnimplementedError();
  }

  @override
  Future<void> signUp(RegisterRequest request) async{

  }

}