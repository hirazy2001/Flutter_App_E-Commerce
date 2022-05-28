import 'package:bloc/bloc.dart';
import 'package:flutter_app_e_commerce/src/bloc/home/home_event.dart';
import 'package:flutter_app_e_commerce/src/bloc/home/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState>{
  HomeBloc() : super(LoadingState()){
    on<RefreshEvent>(_onRefreshHome);
  }

  void onLoadHome(){

  }

  void _onRefreshHome(RefreshEvent event, Emitter<HomeState> emitter){



  }
}