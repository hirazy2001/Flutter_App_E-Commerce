import 'package:flutter_app_e_commerce/src/data/data_repository.dart';
import 'package:flutter_app_e_commerce/src/data/model/request/otp_auth.dart';
import 'package:flutter_app_e_commerce/src/data/model/request/otp_request.dart';
import 'package:flutter_app_e_commerce/src/data/model/response/response_code.dart';
import 'package:flutter_app_e_commerce/src/data/remote/remote_data_source.dart';
import '../common/locator.dart';
import 'local/preference.dart';
import 'model/request/login_request.dart';

class DataRepositoryImpl implements DataRepository {
  final Preference _preferences = locator<Preference>();
  final RemoteDataSource _remoteDataSource = locator<RemoteDataSource>();

  @override
  Future<String?> getToken() async {
    return await _preferences.getToken();
  }

  @override
  Future<bool?> firstOpenApp() async {
    return await _preferences.firstOpenApp();
  }

  @override
  Future<void> cacheFirstOpenApp() async {
    return await _preferences.cacheFirstOpenApp();
  }

  @override
  Future<String> cacheLoginLastly() {
    throw UnimplementedError();
  }

  @override
  Future<ResponseCode> login(LoginRequest request) async {
    return await _remoteDataSource.login(request);
  }

  @override
  Future<String> cacheLastLogin() {
    throw UnimplementedError();
  }

  @override
  Future<void> getLastLogin() {
    throw UnimplementedError();
  }

  @override
  Future<void> signInFacebook() async {}

  @override
  Future<void> signInGoogle() async {}

  @override
  Future<ResponseCode> requestEmailOtp(OtpRequest otpRequest) async {
    return await _remoteDataSource.requestEmailOtp(otpRequest);
  }

  @override
  Future<ResponseCode> requestPhoneOtp(OtpRequest otpRequest) async {
    return await _remoteDataSource.requestPhoneOtp(otpRequest);
  }

  @override
  Future<ResponseCode> authOtp(OtpAuth otpAuth) async {
    return await _remoteDataSource.authRequestOtp(otpAuth);
  }

  @override
  Future<void> setToken(String token) async{
    return await _preferences.setToken(token);
  }

  @override
  Future<ResponseCode> requestHomeProducts() async{
    return await _remoteDataSource.requestHomeProducts();
  }
}
