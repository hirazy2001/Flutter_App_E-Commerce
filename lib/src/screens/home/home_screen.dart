import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_e_commerce/src/bloc/home/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:lottie/lottie.dart';

import '../../bloc/home/home_bloc.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "/home";

  @override
  HomeScreenState createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is LoadingState) {
        } else if (state is HomeRefreshFailedState) {
        } else {}
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: CustomRefreshIndicator(
              onRefresh: () async {},
              builder: (BuildContext context, Widget child,
                  IndicatorController controller) {
                return Container(
                  child: Lottie.asset(''),
                );
              },
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    StaggeredGrid.count(
                      crossAxisCount: 2,
                      children: [],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
