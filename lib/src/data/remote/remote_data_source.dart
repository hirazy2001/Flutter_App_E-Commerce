import 'package:flutter_app_e_commerce/src/data/model/request/login_request.dart';
import 'package:flutter_app_e_commerce/src/data/model/request/otp_auth.dart';

import '../model/request/otp_request.dart';
import '../model/response/response_code.dart';

abstract class RemoteDataSource{
  Future<ResponseCode> login(LoginRequest loginRequest);

  Future<void> authRequestOtp(OtpAuth otpAuth);

  Future<void> requestPhoneOtp(OtpRequest otpRequest);

  Future<void> requestEmailOtp(OtpRequest otpRequest);

  Future<void> requestHome();

  Future<void> logout();
}