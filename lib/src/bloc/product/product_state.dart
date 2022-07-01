import 'package:equatable/equatable.dart';
import 'package:flutter_app_e_commerce/src/data/model/product_detail_view.dart';

import '../../data/model/product.dart';
import '../../data/model/shop_view.dart';

class ProductState extends Equatable{
  @override
  List<Object?> get props => [];
}

class ProductLoadingState extends ProductState{

}

class ProductLoadedSuccessState extends ProductState{
  ProductDetailView productDetailView = tempProductView;
  Product product;
  ShopView shopView = tmpShopView;

  ProductLoadedSuccessState({required this.product});
}

class ProductLoadFailedState extends ProductState{

}