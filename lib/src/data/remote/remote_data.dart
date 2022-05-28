import 'dart:convert';

import 'package:flutter_app_e_commerce/src/common/constants.dart';
import 'package:flutter_app_e_commerce/src/data/model/request/login_request.dart';
import 'package:flutter_app_e_commerce/src/data/model/response/user_facebook_model.dart';
import 'package:flutter_app_e_commerce/src/data/remote/remote_data_source.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:http/http.dart' as http;

import '../model/request/otp_request.dart';

class RemoteData implements RemoteDataSource {
  @override
  Future<void> login(LoginRequest loginRequest) {
    throw UnimplementedError();
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
  Future<void> signInGoogle() async {}

  @override
  Future<void> signOutFaceBook() async {
    await FacebookAuth.i.logOut();
  }

  @override
  Future<void> authRequestOtp() async {
    throw UnimplementedError();
  }

  @override
  Future<void> requestEmailOtp(OtpRequest otpRequest) async {
    var headers = {
      'Authorization': 'Bearer ' + Constants.MASTER_KEY,
      'Content-Type': 'application/json'
    };
    var request =
        http.Request('POST', Uri.http(Constants.BASE_URL + 'otps/email', '', {} ));
    request.body = json.encode({"email": otpRequest.phone});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  @override
  Future<void> requestPhoneOtp(OtpRequest otpRequest) async{
    print("REMOTE REQUEST PHONE OTP");
    try{
      var headers = {
        'Authorization': 'Bearer ' + Constants.MASTER_KEY,
        'Content-Type': 'application/json'
      };

      var request =
        await http.Request('POST', Uri.http(Constants.BASE_URL + 'otps/phone', ''));

      print("BASE_URL " + Constants.BASE_URL + 'otps/phone');

      request.body = json.encode({"phone": otpRequest.phone});
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        print("Response " + await response.stream.bytesToString());
      } else {
        print("Response Error " + response.reasonPhrase.toString());
      }
    }
    on Exception catch(e){
      print("Exception " + e.toString());
    }

  }

  @override
  Future<void> requestHome() {
    throw UnimplementedError();
  }
}
