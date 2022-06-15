import 'package:bloc/bloc.dart';
import 'package:flutter_app_e_commerce/src/bloc/search_product/search_product_event.dart';
import 'package:flutter_app_e_commerce/src/bloc/search_product/search_product_state.dart';

class SearchProductBloc extends Bloc<SearchProductEvent, SearchProductState>{
  SearchProductBloc(SearchProductState initialState) : super(initialState);

}