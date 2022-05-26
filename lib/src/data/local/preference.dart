import 'dart:async';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../main.dart';
import '../../utils/call_native_utils.dart';

abstract class Preference {
  Future getSharedPref();

  Future<bool> firstOpenApp();

  Future<void> cacheFirstOpenApp();

  Future<void> setToken(String token);

  Future<String> setLastLogin();

  Future<String> getToken();

  Future<void> setLanguage(String lang);

  Future<String> getLanguage();
}

class PreferenceImpl extends Preference {
  final String _LANGUAGE = "language";
  final String _EMAIL = "email";

  final String _TOKEN_APP = "token_app";
  final String _GET_DATA_SHAREPREF = "get_data_sharepref";
  final String FIRST_OPEN_APP = "first_open_app";

  PreferenceImpl() {
    SharedPreferences.setMockInitialValues({});
  }

  // SharedPreferences preferences =
  FlutterSecureStorage secureStorage = const FlutterSecureStorage();

  // PreferenceImpl(){
  //   Preference.setMockInitialValues({});
  // }

  Future<dynamic> getKeyPref(String key, bool isString) async {
    Completer completer = Completer();
    SharedPreferences.getInstance().then((pref) {
      return isString ? pref.getString(key) : pref.getBool(key);
    }).then((value) {
      if (value != null) {
        completer.complete(value);
      } else {
        if(!isString){
          completer.complete(true);
        }
        else{
          completer.complete("null");
        }
      }
    });
    return await completer.future;
  }

  @override
  Future<void> setToken(String token) async {
    await secureStorage.write(key: _TOKEN_APP, value: token);
  }

  @override
  Future<String> getToken() async {
    if (!await secureStorage.containsKey(key: _TOKEN_APP)) {
      return "";
    }
    return await secureStorage.read(key: _TOKEN_APP) ?? "";
  }

  @override
  Future<void> setLanguage(String lang) async {
    Completer<String> completer = new Completer();
    CallNativeUtils.invokeMethod(
        method: _GET_DATA_SHAREPREF,
        arguments: {"key": _LANGUAGE}).then((value) {
      completer.complete(value == "" ? null : value);
    });
  }

  @override
  Future getSharedPref() {
    Completer completer = Completer();
    SharedPreferences.getInstance().then((pref) {
      return pref.getString("demo");
    }).then((value) {
      if (value != null) {
        completer.complete(value);
      } else {
        completer.complete("null");
      }
    });
    return completer.future;
  }

  @override
  Future<String> getLanguage() async {
    return await getKeyPref(_LANGUAGE, true);
  }

  @override
  Future<bool> firstOpenApp() async {
    return await getKeyPref(FIRST_OPEN_APP, false);
  }

  @override
  Future<String> setLastLogin() {
    throw UnimplementedError();
  }

  @override
  Future<void> cacheFirstOpenApp() async {
    SharedPreferences.getInstance().then((pref) async{
      bool isSaved = await pref.setBool(FIRST_OPEN_APP, false) ;
      print("Saved " + isSaved.toString());
    });
  }
}
