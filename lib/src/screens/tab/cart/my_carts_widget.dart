import 'package:flutter/material.dart';
import 'package:flutter_app_e_commerce/src/bloc/cart/cart_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyCartsWidget extends StatefulWidget {
  @override
  MyCartsWidgetState createState() {
    return MyCartsWidgetState();
  }
}

class MyCartsWidgetState extends State<MyCartsWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => CartBloc(),
        child: SafeArea(
            child: Scaffold(
          body: Column(
            children: [

            ],
          ),
        )));
  }
}
