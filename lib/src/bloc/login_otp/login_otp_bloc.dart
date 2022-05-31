import 'package:bloc/bloc.dart';
import 'package:flutter_app_e_commerce/src/bloc/login_otp/login_otp_event.dart';
import 'package:flutter_app_e_commerce/src/bloc/login_otp/login_otp_state.dart';

class LoginOtpBloc extends Bloc<LoginOtpEvent, LoginOtpState>{
  LoginOtpBloc(LoginOtpState initialState) : super(initialState);

}