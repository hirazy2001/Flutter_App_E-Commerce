import 'package:flutter/material.dart';
import 'package:flutter_app_e_commerce/src/screens/chat/chat_screen.dart';
import 'package:flutter_app_e_commerce/src/screens/login/login_screen.dart';
import 'package:flutter_app_e_commerce/src/screens/login_otp/login_otp_screen.dart';
import 'package:flutter_app_e_commerce/src/screens/onboarding/onboarding_screen.dart';
import 'package:flutter_app_e_commerce/src/screens/otp/otp_screen.dart';
import 'package:flutter_app_e_commerce/src/screens/product_detail/product_detail_screen.dart';
import 'package:flutter_app_e_commerce/src/screens/search_products/search_product_screen.dart';
import 'package:flutter_app_e_commerce/src/screens/setting/setting_screen.dart';
import 'package:flutter_app_e_commerce/src/screens/sign_up/sign_up_screen.dart';
import 'package:flutter_app_e_commerce/src/screens/splash/splash_screen.dart';
import 'package:flutter_app_e_commerce/src/screens/tab/search_products/search_products_widget.dart';
import 'package:flutter_app_e_commerce/src/screens/tab/tab_screen.dart';

import '../data/model/arguments/otp_argument.dart';
import '../screens/authentication/authentication_screen.dart';

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (context) => OnBoardingScreen(),
            settings: const RouteSettings(name: OnBoardingScreen.routeName));

      case TabScreen.routeName:
        return MaterialPageRoute(
            builder: (context) => TabScreen(),
            settings: const RouteSettings(name: TabScreen.routeName));
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

      case LoginOtpScreen.routeName:
        return MaterialPageRoute(
            builder: (context) => LoginOtpScreen(),
            settings: const RouteSettings(name: LoginOtpScreen.routeName));

      case LoginScreen.routeName:
        return MaterialPageRoute(
            builder: (context) => LoginScreen(),
            settings: const RouteSettings(name: LoginScreen.routeName));

      case SignUpScreen.routeName:
        return MaterialPageRoute(
            builder: (context) => SignUpScreen(emailOrPhone: settings.arguments as String),
            settings: const RouteSettings(name: SignUpScreen.routeName)
        );

      case SearchProductScreen.routeName:
        return MaterialPageRoute(
            builder: (context) => const SearchProductScreen(),
            settings: const RouteSettings(name: SearchProductScreen.routeName)
        );

      case ProductDetailScreen.routeName:
        return MaterialPageRoute(
            builder: (context) => ProductDetailScreen(productId: settings.arguments as String),
            settings: const RouteSettings(name: ProductDetailScreen.routeName)
        );

      case ChatScreen.routeName:
        return MaterialPageRoute(
            builder: (context) => ChatScreen(roomId: settings.arguments as String),
            settings: const RouteSettings(name: ProductDetailScreen.routeName)
        );

      default:
        return MaterialPageRoute(
            builder: (context) => TabScreen(),
            settings: const RouteSettings(name: TabScreen.routeName));
    }
  }
}
