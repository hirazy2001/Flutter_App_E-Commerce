import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app_e_commerce/src/data/data_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/auth_utils.dart';
import '../../common/locator.dart';
import '../authentication/authentication_event.dart';
import '../authentication/authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {

  AuthUtils authUtils = AuthUtils.instance;
  final DataRepository _dataRepository = locator<DataRepository>();

  AuthenticationBloc() : super(const AuthenticationState()) {
    on<AppStarted>(_onLoadAuthentication);
    on<AuthenticationGoogle>(_signInGoogle);
    on<AuthenticationFacebook>(_signInFaceBook);
    on<AuthenticationPhoneRequestOtp>(_requestPhoneAuthOtp);
    on<AuthenticationEmailRequestOtp>(_requestEmailAuthOtp);
    on<AuthenticationLoginEvent>(_login);
    on<RegisterEvent>(_signUp);
  }

  String _token = "";

  void _onLoadAuthentication(
      AppStarted event, Emitter<AuthenticationState> emitter) async {
    emitter(const AuthenticationLoading());
    bool isFirst = (await _dataRepository.firstOpenApp())!;
    if (!isFirst) {
      emitter(FirstOpenApp());
    } else {
      _token = (await _dataRepository.getToken())!;
      if (_token != "") {
        emitter(const AuthenticatedState());
      } else {
        emitter(const UnAuthenticatedState());
      }
    }
  }

  Future<void> _login(AuthenticationLoginEvent event,
      Emitter<AuthenticationState> emitter) async {
    emitter(const AuthenticationLoading());
    await _dataRepository.login(event.loginRequest);
    emitter(const AuthenticatedState());
  }

  Future<void> cacheFirstOpenApp() async {
    await _dataRepository.cacheFirstOpenApp();
  }

  void _signInFaceBook(AuthenticationFacebook event,
      Emitter<AuthenticationState> emitter) async {
    try {
      UserCredential userCredential = await authUtils.loginFacebook();
      emitter(const AuthenticatedState());
    } on Error catch (e) {}
  }

  void _signUp(RegisterEvent event, Emitter<AuthenticationState> emitter) async{


  }

  void _signInGoogle(
      AuthenticationGoogle event, Emitter<AuthenticationState> emitter) async {
    try {
      UserCredential userCredential = await authUtils.loginGoogle();
      print("Email " + userCredential.user!.email!);
      emitter(const AuthenticatedState());
    } on Error catch (e) {}
  }

  void _requestPhoneAuthOtp(AuthenticationPhoneRequestOtp event,
      Emitter<AuthenticationState> emitter) async{

    emitter(const OtpSendingState());
    try {
      await _dataRepository.requestPhoneOtp(event.otpRequest);
      emitter(const OtpSentState());
    } on Error catch (e) {
      emitter(const OtpErrorState());
    }
  }

  void _requestEmailAuthOtp(AuthenticationEmailRequestOtp event,
      Emitter<AuthenticationState> emitter) async{
    emitter(const OtpSendingState());
    var data = await _dataRepository.requestEmailOtp(event.otpRequest);
    emitter(const OtpSentState());
  }

  Future<void> authenticate() async {}

  Future<void> signup(RegisterEvent event, Emitter<AuthenticationState> emitter) async {
    // emitter(const )
  }

  Future<void> logout() async {}
}
