import 'package:equatable/equatable.dart';

import '../../data/model/product.dart';

class ProductState extends Equatable{
  @override
  List<Object?> get props => [];
}

class ProductLoadingState extends ProductState{

}

class ProductLoadedSuccessState extends ProductState{
  Product product;

  ProductLoadedSuccessState({required this.product});
}

class ProductLoadFailedState extends ProductState{

}