import 'package:flutter_app_e_commerce/src/data/model/request/login_request.dart';

import '../model/request/otp_request.dart';

abstract class RemoteDataSource{
  Future<void> login(LoginRequest loginRequest);

  Future<void> signInFaceBook();

  Future<void> signOutFaceBook();

  Future<void> signInGoogle();

  Future<void> authRequestOtp();

  Future<void> requestPhoneOtp(OtpRequest otpRequest);

  Future<void> requestEmailOtp(OtpRequest otpRequest);

  Future<void> requestHome();
}