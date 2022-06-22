import 'package:bloc/bloc.dart';
import 'package:flutter_app_e_commerce/src/bloc/password_reset/password_reset_event.dart';
import 'package:flutter_app_e_commerce/src/bloc/password_reset/password_reset_state.dart';

class PasswordResetBloc extends Bloc<PasswordResetEvent, PasswordResetState>{
  PasswordResetBloc(PasswordResetState initialState) : super(initialState);
}