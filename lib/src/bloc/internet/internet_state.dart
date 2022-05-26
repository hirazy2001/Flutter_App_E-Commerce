import 'package:equatable/equatable.dart';
import 'package:flutter_app_e_commerce/src/data/model/connection_type.dart';

class InternetState extends Equatable{

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class InternetLoading extends InternetState{

}

class InternetConnected extends InternetState{
  final ConnectionType connectionType;

  InternetConnected({required this.connectionType});
}

class InternetDisconnected extends InternetState{

}