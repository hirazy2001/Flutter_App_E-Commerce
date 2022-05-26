import 'package:flutter_app_e_commerce/src/data/model/request/login_request.dart';

abstract class RemoteDataSource{
  Future<void> login(LoginRequest loginRequest);

  Future<void> signInFaceBook();

  Future<void> signOutFaceBook();

  Future<void> signInGoogle();

  Future<void> authRequestOtp();
}