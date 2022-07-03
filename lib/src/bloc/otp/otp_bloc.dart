import 'package:bloc/bloc.dart';
import 'package:flutter_app_e_commerce/src/bloc/otp/otp_event.dart';
import 'package:flutter_app_e_commerce/src/bloc/otp/otp_state.dart';
import 'package:flutter_app_e_commerce/src/data/data_repository.dart';

import '../../common/locator.dart';

class OtpBloc extends Bloc<OtpEvent, OtpState> {

  final int _sentCode = 202;
  final int _errorCode = 400;
  final int _serverErrorCode = 500;

  OtpBloc() : super(OtpState()) {
    on<OtpRequestEmail>(_onRequestEmail);
    on<OtpRequestPhone>(_onRequestPhone);
    on<OtpAuthEvent>(_onAuthOtp);
  }

  final DataRepository _dataRepository = locator<DataRepository>();

  void _onRequestEmail(OtpRequestEmail event, Emitter<OtpState> emitter) async {

    emitter(OtpRequest());
    var data = await _dataRepository.requestEmailOtp(event.otpRequest);
    if(data.code == _sentCode){

    }
    else{

    }
    emitter(OtpRequest());
  }

  void _onRequestPhone(OtpRequestPhone event, Emitter<OtpState> emitter) async {
    await _dataRepository.requestEmailOtp(event.otpRequest);
  }

  void _onAuthOtp(OtpAuthEvent event, Emitter<OtpState> emitter) async {
    emitter(OtpRequest());
    await _dataRepository.authOtp(event.otpAuth);
    emitter(OtpAuthSuccess());
  }
}
