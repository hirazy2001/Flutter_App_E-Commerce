import 'package:bloc/bloc.dart';
import 'package:flutter_app_e_commerce/src/bloc/home/home_event.dart';
import 'package:flutter_app_e_commerce/src/bloc/home/home_state.dart';

class HomeBloc extends Bloc<HomeState, HomeEvent>{
  HomeBloc(HomeEvent initialState) : super(initialState);


}