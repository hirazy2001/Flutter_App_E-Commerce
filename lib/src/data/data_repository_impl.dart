import 'package:flutter_app_e_commerce/src/data/data_repository.dart';
import 'package:flutter_app_e_commerce/src/data/remote/remote_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../main.dart';
import '../common/locator.dart';
import 'local/preference.dart';

class DataRepositoryImpl implements DataRepository{

  final Preference _preferences = locator<Preference>();
  final RemoteDataSource _remoteDataSource = locator<RemoteDataSource>();

  @override
  Future<String?> getToken() async{
    return await _preferences.getToken();
  }

  @override
  Future<bool?> firstOpenApp() async{
    return await _preferences.firstOpenApp();
  }

  @override
  Future<void> cacheFirstOpenApp() async{
    return await _preferences.cacheFirstOpenApp();
  }

  @override
  Future<String> cacheLoginLastly() {
    throw UnimplementedError();
  }

  @override
  Future<void> login() {
    throw UnimplementedError();
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
  Future<void> signInFacebook() async{
    await _remoteDataSource.signInFaceBook();
  }

  @override
  Future<void> signInGoogle() async{
    await _remoteDataSource.signInGoogle();
  }

  @override
  Future<void> requestOtp() async{
    await _remoteDataSource.authRequestOtp();
  }

}