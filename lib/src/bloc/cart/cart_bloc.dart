import 'package:bloc/bloc.dart';
import 'package:flutter_app_e_commerce/src/bloc/cart/cart_event.dart';
import 'package:flutter_app_e_commerce/src/bloc/cart/cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState>{
  CartBloc() : super(CartState()){

  }


}