import 'package:flutter_app_e_commerce/main.dart';
import 'package:flutter_app_e_commerce/src/data/data_repository_impl.dart';
import 'package:flutter_app_e_commerce/src/data/model/request/login_request.dart';
import 'package:flutter_app_e_commerce/src/data/model/request/otp_auth.dart';
import 'package:flutter_app_e_commerce/src/data/model/request/otp_request.dart';
import 'package:flutter_app_e_commerce/src/data/model/response/response_code.dart';

import '../common/locator.dart';

abstract class DataRepository {
  Future<void> setToken(String token);

  Future<String?> getToken();

  Future<bool?> firstOpenApp();

  Future<void> cacheFirstOpenApp();

  Future<String> cacheLastLogin();

  Future<ResponseCode> login(LoginRequest request);

  Future<void> getLastLogin();

  Future<void> signInFacebook();

  Future<void> signInGoogle();

  Future<ResponseCode> requestHomeProducts();

  Future<ResponseCode> requestPhoneOtp(OtpRequest otpRequest);

  Future<ResponseCode> requestEmailOtp(OtpRequest otpRequest);

  Future<ResponseCode> authOtp(OtpAuth otpAuth);
}
