import 'package:equatable/equatable.dart';

import '../../data/model/request/otp_auth.dart';
import '../../data/model/request/otp_request.dart';

class OtpEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class OtpRequestEmail extends OtpEvent {
  final OtpRequest otpRequest;

  OtpRequestEmail({required this.otpRequest});
}

class OtpRequestPhone extends OtpEvent {
  final OtpRequest otpRequest;

  OtpRequestPhone({required this.otpRequest});
}

class OtpAuthEvent extends OtpEvent {
  final OtpAuth otpAuth;

  OtpAuthEvent({required this.otpAuth});
}
