import 'package:equatable/equatable.dart';
import 'package:flutter_app_e_commerce/src/data/model/request/login_request.dart';
import 'package:flutter_app_e_commerce/src/data/model/request/otp_request.dart';

class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object?> get props => throw UnimplementedError();
}

class AppStarted extends AuthenticationEvent {}

class AuthenticationLoginEvent extends AuthenticationEvent {
  final LoginRequest loginRequest;

  AuthenticationLoginEvent({required this.loginRequest});
}

class AuthenticationPhoneRequestOtp extends AuthenticationEvent{
  final OtpRequest otpRequest;

  const AuthenticationPhoneRequestOtp({required this.otpRequest});
}

class AuthenticationEmailRequestOtp extends AuthenticationEvent{
  final OtpRequest otpRequest;

  const AuthenticationEmailRequestOtp({required this.otpRequest});
}

class AuthenticationVerifyOtp extends AuthenticationEvent{
  final OtpRequest otpRequest;

  const AuthenticationVerifyOtp({required this.otpRequest});
}

class AuthenticationFailedEvent extends AuthenticationEvent {}

class AuthenticationSuccessEvent extends AuthenticationEvent {}

class AuthenticationGoogle extends AuthenticationEvent{}

class AuthenticationFacebook extends AuthenticationEvent{}