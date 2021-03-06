import 'package:bloc/bloc.dart';
import 'package:flutter_app_e_commerce/src/bloc/product/product_event.dart';
import 'package:flutter_app_e_commerce/src/bloc/product/product_state.dart';
import 'package:flutter_app_e_commerce/src/common/constants.dart';

import '../../common/locator.dart';
import '../../data/data_repository.dart';
import '../../data/model/product.dart';
import '../../data/model/product_view.dart';
import '../../data/model/shop_view.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState>{

  final DataRepository _dataRepository = locator<DataRepository>();

  String id = "";
  Product? product;
  ShopView? shopView;
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