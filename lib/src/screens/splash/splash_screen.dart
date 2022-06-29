import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app_e_commerce/src/bloc/authentication/authentication_state.dart';
import 'package:flutter_app_e_commerce/src/screens/authentication/authentication_screen.dart';
import 'package:flutter_app_e_commerce/src/screens/tab/tab_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../bloc/authentication/authentication_bloc.dart';
import '../../bloc/authentication/authentication_event.dart';
import '../../widgets/splash/body_splash.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "/splash";

  @override
  SplashScreenState createState() {
    return SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen> {
  PackageInfo _packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
    buildSignature: 'Unknown',
  );

  late Timer _timer;
  var timerCountDown = const Duration(seconds: 5);
  int countdown = 4;

  @override
  void initState() {
    super.initState();
    _initPackageInfo();
  }

  Future<void> _initPackageInfo() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
    });
  }

  @override
  Widget build(BuildContext context) {
    var authBloc = BlocProvider.of<AuthenticationBloc>(context);

    _timer = Timer.periodic(
      timerCountDown,
      (Timer timer) {
        countdown--;
        if (countdown == 0) {
          authBloc.add(AppStarted());
        }
      },
    );

    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state is AuthenticatedState) {
          Navigator.popAndPushNamed(context, TabScreen.routeName);
        } else {
          Navigator.popAndPushNamed(context, AuthenticationScreen.routeName);
        }
      },
      child: Scaffold(
        body: Stack(
          children: [
            Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                  Color.fromARGB(100, 50, 156, 248),
                  Color.fromARGB(100, 53, 149, 232),
                  Color.fromARGB(100, 80, 164, 238),
                  Color.fromARGB(100, 176, 212, 243),
                  Color.fromARGB(100, 50, 156, 248),
                ]))),
            const Positioned(
                bottom: 0,
                top: 0,
                right: 0,
                left: 0,
                child: Align(
                  child: BodySplash(),
                  alignment: Alignment.centerLeft,
                )),
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Center(
                  child: Text(
                "Version " + _packageInfo.version,
                style: GoogleFonts.andada().copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 14),
              )),
            )
          ],
        ),
      ),
    );
  }
}
