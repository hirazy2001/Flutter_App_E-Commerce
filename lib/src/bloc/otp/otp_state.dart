import 'package:equatable/equatable.dart';

class OtpState extends Equatable{

  @override
  List<Object?> get props => throw UnimplementedError();
}

class OtpRequest extends OtpState{

}

class OtpRequestSuccess extends OtpState{
}

class OtpRequestFailed extends OtpState{
}

class OtpAuthSuccess extends OtpState{
}

class OtpAuthFailed extends OtpState{
}