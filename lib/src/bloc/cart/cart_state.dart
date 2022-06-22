import 'package:equatable/equatable.dart';

import '../../data/model/cart.dart';

class CartState extends Equatable{
  @override
  List<Object?> get props => throw UnimplementedError();
}

class CartLoaded extends CartState{
  List<Cart> carts;

  CartLoaded({required this.carts});
}