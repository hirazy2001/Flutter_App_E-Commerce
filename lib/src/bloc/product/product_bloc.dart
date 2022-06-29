import 'package:bloc/bloc.dart';
import 'package:flutter_app_e_commerce/src/bloc/product/product_event.dart';
import 'package:flutter_app_e_commerce/src/bloc/product/product_state.dart';
import 'package:flutter_app_e_commerce/src/common/constants.dart';

import '../../data/model/product.dart';
import '../../data/model/product_view.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState>{

  String id = "";
  Product? product;

  List<ProductView> productViews = [];

  ProductBloc() : super(ProductLoadingState()){
    on<ProductLoadingEvent>(loadProduct);
    on<ProductLoadMoreEvent>(loadMoreProduct);
  }

  void loadProduct(ProductLoadingEvent productLoad, Emitter<ProductState> emitter){
    product = products[0];
    emitter(ProductLoadedSuccessState(product: product!));
  }

  void loadMoreProduct(ProductLoadMoreEvent event, Emitter<ProductState> emitter){

  }
}