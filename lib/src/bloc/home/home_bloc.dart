import 'package:bloc/bloc.dart';
import 'package:flutter_app_e_commerce/src/bloc/home/home_event.dart';
import 'package:flutter_app_e_commerce/src/bloc/home/home_state.dart';

import '../../common/locator.dart';
import '../../data/data_repository.dart';
import '../../data/model/product.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {

  final List<Product> products = [];
  final DataRepository _dataRepository = locator<DataRepository>();

  HomeBloc() : super(const LoadingState()) {
    on<HomeRefreshEvent>(_onRefreshHome);
  }

  void onLoadHome(HomeRefreshEvent event, Emitter<HomeState> emitter) {
    emitter(const LoadingState());
  }

  void _onRefreshHome(HomeRefreshEvent event, Emitter<HomeState> emitter) async{
    emitter(const LoadingState());
    var productResponse = await _dataRepository.requestHomeProducts();
    if(productResponse.code == 200){

      emitter(const HomeLoadSuccessState());
    }
    else{

      emitter(const HomeLoadFailedState());
    }
  }

  void _onDetailProduct() {

  }
}
