import 'package:equatable/equatable.dart';
import 'package:flutter_app_e_commerce/src/data/model/user.dart';

class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object?> get props => throw UnimplementedError();
}

class AuthenticationLoading extends AuthenticationState {
  const AuthenticationLoading();

  @override
  List<Object?> get props => throw UnimplementedError();
}

class FirstOpenApp extends AuthenticationState{

  @override
  List<Object?> get props => throw UnimplementedError();
}

class AuthenticatedState extends AuthenticationState {
  const AuthenticatedState();

  @override
  List<Object?> get props => throw UnimplementedError();
}

class UnAuthenticatedState extends AuthenticationState {
  const UnAuthenticatedState();

  @override
  List<Object?> get props => throw UnimplementedError();
}

class OtpSendingState extends AuthenticationState{
  const OtpSendingState();
}

class OtpSentState extends AuthenticationState{
  const OtpSentState();
}

class OtpErrorState extends AuthenticationState{
  const OtpErrorState();
}