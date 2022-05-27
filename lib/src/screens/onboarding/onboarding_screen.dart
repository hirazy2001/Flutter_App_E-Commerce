import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_e_commerce/src/bloc/authentication/authentication_bloc.dart';
import 'package:flutter_app_e_commerce/src/bloc/internet/internet_cubit.dart';
import 'package:flutter_app_e_commerce/src/bloc/internet/internet_state.dart';
import 'package:flutter_app_e_commerce/src/common/constants.dart';
import 'package:flutter_app_e_commerce/src/data/model/slider.dart';
import 'package:flutter_app_e_commerce/src/screens/authentication/authentication_screen.dart';
import 'package:flutter_app_e_commerce/src/widgets/onboarding/slider_dots.dart';
import 'package:flutter_app_e_commerce/src/widgets/onboarding/slider_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBoardingScreen extends StatefulWidget {
  static const routeName = "/onboarding";

  @override
  OnBoardingScreenState createState() {
    return OnBoardingScreenState();
  }
}

class OnBoardingScreenState extends State<OnBoardingScreen> {
  int _currentPage = 0;
  final PageController _controller = PageController(initialPage: 0);

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();

    // Timer.periodic(const Duration(seconds: 6), (timer) {
    //   if (_currentPage < 2) {
    //     _currentPage++;
    //   } else {
    //     _currentPage = 0;
    //   }
    // });
  }

  _onPageChanged(index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              BlocConsumer<InternetCubit, InternetState>(
                  listener: (context, state) {
                if (state is InternetConnected) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text(
                      "Internet connected",
                      style: TextStyle(color: Colors.green),
                    ),
                    duration: const Duration(seconds: 3),
                  ));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text(
                      "Internet disconnected",
                      style: TextStyle(color: Colors.red),
                    ),
                    duration: const Duration(seconds: 3),
                  ));
                }
              }, builder: (context, state) {
                if (state is InternetConnected) {
                  return Text("");
                } else {
                  return Text("Internet Disconnected");
                }
              }),
              PageView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                controller: _controller,
                onPageChanged: _onPageChanged,
                itemBuilder: (context, index) => SliderItem(index: index),
              ),
              Stack(
                alignment: AlignmentDirectional.topStart,
                children: [
                  Align(
                    alignment: Alignment.bottomRight,
                    child: InkWell(
                      onTap: () async{
                        if (_currentPage == sliderList.length - 1) {
                          await BlocProvider.of<AuthenticationBloc>(context)
                              .cacheFirstOpenApp();
                          Navigator.of(context)
                              .popAndPushNamed(AuthenticationScreen.routeName);
                        } else {
                          _controller.nextPage(
                              duration: const Duration(microseconds: 300),
                              curve: Curves.easeInOut);
                          _currentPage += 1;
                          _onPageChanged(_currentPage);
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Text(
                          (_currentPage != sliderList.length - 1)
                              ? Constants.NEXT
                              : Constants.FINISH,
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: InkWell(
                      onTap: () {
                        // BlocProvider.of(context).
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(15),
                        child: Text(
                          Constants.SKIP,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                  Container(
                      alignment: AlignmentDirectional.bottomCenter,
                      margin: const EdgeInsets.only(bottom: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          for (int i = 0; i < sliderList.length; i++)
                            if (_currentPage == i)
                              SliderDots(isActive: true)
                            else
                              SliderDots(isActive: false)
                        ],
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}
