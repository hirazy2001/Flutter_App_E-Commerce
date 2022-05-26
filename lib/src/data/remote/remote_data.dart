import 'package:flutter_app_e_commerce/src/data/model/request/login_request.dart';
import 'package:flutter_app_e_commerce/src/data/model/response/user_facebook_model.dart';
import 'package:flutter_app_e_commerce/src/data/remote/remote_data_source.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class RemoteData implements RemoteDataSource{

  @override
  Future<void> login(LoginRequest loginRequest) {
    throw UnimplementedError();
  }

  @override
  Future<void> signInFaceBook() async {
    final LoginResult result = await FacebookAuth.i.login();
    final AccessToken _accessToken;

    if(result.status == LoginStatus.success){
      _accessToken = result.accessToken!;

      final data = await FacebookAuth.i.getUserData();
      UserFacebookModel model = UserFacebookModel.fromJson(data);
    }
  }

  @override
  Future<void> signInGoogle() async{

  }

  @override
  Future<void> signOutFaceBook() async {
    await FacebookAuth.i.logOut();
  }

  @override
  Future<void> authRequestOtp() async{
    throw UnimplementedError();
  }

}