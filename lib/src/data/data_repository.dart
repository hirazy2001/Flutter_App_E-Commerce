import 'package:flutter_app_e_commerce/main.dart';
import 'package:flutter_app_e_commerce/src/data/data_repository_impl.dart';
import 'package:flutter_app_e_commerce/src/data/model/request/otp_request.dart';

import '../common/locator.dart';

abstract class DataRepository {
  Future<String?> getToken();

  Future<bool?> firstOpenApp();

  Future<void> cacheFirstOpenApp();

  Future<String> cacheLastLogin();

  Future<void> getLastLogin();

  Future<void> signInFacebook();

  Future<void> signInGoogle();

  Future<void> requestPhoneOtp(OtpRequest otpRequest);

  Future<void> requestEmailOtp(OtpRequest otpRequest);

}
