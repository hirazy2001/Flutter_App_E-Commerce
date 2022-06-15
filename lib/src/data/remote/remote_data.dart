import 'dart:convert';

import 'package:flutter_app_e_commerce/src/common/constants.dart';
import 'package:flutter_app_e_commerce/src/data/model/request/login_request.dart';
import 'package:flutter_app_e_commerce/src/data/model/request/otp_auth.dart';
import 'package:flutter_app_e_commerce/src/data/model/response/response_code.dart';
import 'package:flutter_app_e_commerce/src/data/model/response/user_facebook_model.dart';
import 'package:flutter_app_e_commerce/src/data/model/response/user_login.dart';
import 'package:flutter_app_e_commerce/src/data/remote/remote_data_source.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:http/http.dart' as http;
import '../model/request/otp_request.dart';

class RemoteData implements RemoteDataSource {
  @override
  Future<ResponseCode> login(LoginRequest loginRequest) async {
    try {
      String basicAuth = 'Basic ' +
          base64Encode(utf8
              .encode('${loginRequest.phoneOrEmail}:${loginRequest.password}'));
      var headers = {
        'Authorization': 'Basic ' + basicAuth,
        'Content-Type': 'application/x-www-form-urlencoded'
      };
      var request =
          http.Request('POST', Uri.parse(Constants.BASE_URL + 'auth'));
      request.bodyFields = {'access_token': Constants.MASTER_KEY};
      request.headers.addAll(headers);
      http.StreamedResponse streamResponse = await request.send();
      http.Response response = await http.Response.fromStream(streamResponse);
      if (response.statusCode == 201) {
        var userLogin = UserLogin.fromJson(jsonDecode(response.body));
        return ResponseCode(
            code: 201, status: "Login successful!", data: userLogin);
      } else {}
    } on Exception catch (e) {}
    return ResponseCode(code: 500, status: "Server error");
  }

  @override
  Future<void> signInFaceBook() async {
    final LoginResult result = await FacebookAuth.i.login();
    final AccessToken _accessToken;

    if (result.status == LoginStatus.success) {
      _accessToken = result.accessToken!;

      final data = await FacebookAuth.i.getUserData();
      UserFacebookModel model = UserFacebookModel.fromJson(data);
    }
  }

  @override
  Future<ResponseCode> authRequestOtp(OtpAuth otpAuth) async {
    var headers = {
      'Authorization': 'Bearer ' + Constants.MASTER_KEY,
      'Content-Type': 'application/json'
    };
    var request =
        http.Request('POST', Uri.parse(Constants.BASE_URL + 'auth/otp'));
    request.body = json.encode(
        {"email": otpAuth.email, "phone": otpAuth.phone, "otp": otpAuth.otp});
    request.headers.addAll(headers);

    http.StreamedResponse streamResponse = await request.send();
    http.Response response = await http.Response.fromStream(streamResponse);
    if (response.statusCode == 200) {
    } else {

    }
    return ResponseCode(code: 500, status: "Server error!");
  }

  @override
  Future<ResponseCode> requestEmailOtp(OtpRequest otpRequest) async {
    try {
      var headers = {
        'Authorization': 'Bearer ' + Constants.MASTER_KEY,
        'Content-Type': 'application/json'
      };
      var request =
          http.Request('POST', Uri.parse(Constants.BASE_URL + 'otps/email'));
      request.body = json.encode({"email": otpRequest.email});
      request.headers.addAll(headers);
      http.StreamedResponse streamResponse = await request.send();
      http.Response response = await http.Response.fromStream(streamResponse);
      if (response.statusCode == 200) {
        // return ResponseCode(code: , status: status)
      } else {}
    } on Exception catch (e) {}
    return ResponseCode(code: 500, status: "Server error!");
  }

  @override
  Future<ResponseCode> requestPhoneOtp(OtpRequest otpRequest) async {
    try {
      var headers = {
        'Authorization': 'Bearer ' + Constants.MASTER_KEY,
        'Content-Type': 'application/json'
      };
      var request = await http.Request(
          'POST', Uri.parse(Constants.BASE_URL + 'otps/phone'));
      request.body = json.encode({"phone": otpRequest.phone});
      request.headers.addAll(headers);
      http.StreamedResponse streamResponse = await request.send();
      http.Response response = await http.Response.fromStream(streamResponse);
      if (response.statusCode == 200) {
      } else {}
    } on Exception catch (e) {}

    return ResponseCode(code: 500, status: "Server error!");
  }

  @override
  Future<ResponseCode> requestHomeProducts() {
    throw UnimplementedError();
  }

  @override
  Future<void> requestHome() {
    throw UnimplementedError();
  }

  @override
  Future<void> logout() {
    throw UnimplementedError();
  }
}
