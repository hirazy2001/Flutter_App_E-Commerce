import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_e_commerce/src/screens/home/home_screen.dart';
import 'package:flutter_app_e_commerce/src/screens/onboarding/onboarding_screen.dart';
import 'package:flutter_app_e_commerce/src/screens/otp/otp_screen.dart';
import 'package:flutter_app_e_commerce/src/screens/setting/setting_screen.dart';
import 'package:flutter_app_e_commerce/src/screens/splash/splash_screen.dart';

import '../data/model/arguments/otp_argument.dart';
import '../screens/authentication/authentication_screen.dart';

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (context) => OnBoardingScreen(),
            settings: const RouteSettings(name: OnBoardingScreen.routeName));

      case HomeScreen.routeName:
        return MaterialPageRoute(
            builder: (context) => HomeScreen(),
            settings: const RouteSettings(name: HomeScreen.routeName));
      case AuthenticationScreen.routeName:
        return MaterialPageRoute(
            builder: (context) => AuthenticationScreen(),
            settings:
                const RouteSettings(name: AuthenticationScreen.routeName));

      case SplashScreen.routeName:
        return MaterialPageRoute(
            builder: (context) => SplashScreen(),
            settings: const RouteSettings(name: SplashScreen.routeName));

      case SettingScreen.routeName:
        return MaterialPageRoute(
            builder: (context) => SettingScreen(),
            settings: const RouteSettings(name: SettingScreen.routeName));

      case OtpScreen.routName:
        return MaterialPageRoute(
            builder: (context) => OtpScreen(emailOrPhone: settings.arguments as OtpArgument),
            settings: const RouteSettings(name: SettingScreen.routeName));

      default:
        return MaterialPageRoute(
            builder: (context) => HomeScreen(),
            settings: const RouteSettings(name: HomeScreen.routeName));
    }
  }
}
