import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_app_e_commerce/src/bloc/internet/internet_state.dart';

import '../../data/model/connection_type.dart';

class InternetCubit extends Cubit<InternetState> {
  final Connectivity connectivity;
  late StreamSubscription connectionStreamSubscription;

  InternetCubit({required this.connectivity}) : super(InternetLoading()) {
    initInternetConnection();
  }

  StreamSubscription<ConnectivityResult> initInternetConnection() {
    return connectionStreamSubscription =
        connectivity.onConnectivityChanged.listen((event) {
      if (event == ConnectivityResult.wifi) {
        emitInternetConnected(ConnectionType.wifi);
      } else if (event == ConnectivityResult.mobile) {
        emitInternetConnected(ConnectionType.mobile);
      } else if (event == ConnectivityResult.none) {
        emitInternetDisconnected();
      }
    });
  }

  void emitInternetConnected(ConnectionType connectionType) => emit(InternetConnected(connectionType: connectionType));

  void emitInternetDisconnected() => emit(InternetDisconnected());
}
