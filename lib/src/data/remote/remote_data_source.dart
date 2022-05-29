import 'package:flutter_app_e_commerce/src/data/model/request/login_request.dart';
import 'package:flutter_app_e_commerce/src/data/model/request/otp_auth.dart';

import '../model/request/otp_request.dart';

abstract class RemoteDataSource{
  Future<void> login(LoginRequest loginRequest);

  Future<void> signInFaceBook();

  Future<void> signOutFaceBook();

  Future<void> signInGoogle();

  Future<void> authRequestOtp(OtpAuth otpAuth);

  Future<void> requestPhoneOtp(OtpRequest otpRequest);

  Future<void> requestEmailOtp(OtpRequest otpRequest);

  Future<void> requestHome();

  Future<void> logout();
}