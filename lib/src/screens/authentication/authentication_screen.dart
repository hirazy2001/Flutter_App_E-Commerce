import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_e_commerce/src/bloc/authentication/authentication_bloc.dart';
import 'package:flutter_app_e_commerce/src/screens/login_otp/login_otp_screen.dart';
import 'package:flutter_app_e_commerce/src/widgets/login/button_facebook.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../bloc/authentication/authentication_event.dart';
import '../../common/constants.dart';
import '../../widgets/login/button_google.dart';

class AuthenticationScreen extends StatefulWidget {
  static const routeName = "/authentication";

  @override
  AuthenticationScreenState createState() {
    return AuthenticationScreenState();
  }
}

class AuthenticationScreenState extends State<AuthenticationScreen> {
  @override
  Widget build(BuildContext context) {
    final authBloc = BlocProvider.of<AuthenticationBloc>(context);

    Widget topScreen() {
      return Column(
        children: [
          Container(
            width: 60,
            height: 60,
            child:
                const Image(image: AssetImage('assets/images/ic_github.png')),
          ),
          const Text(
            "Hirazy",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 28,
                fontFamily: Constants.FONT_LAPSUS_PRO),
          ),
          Text(
            "Ecommerce App of Hirazy!",
            style: GoogleFonts.alegreyaSans().copyWith(
                color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20),
          )
        ],
      );
    }

    Widget middleScreen() {
      return Container(
          margin: const EdgeInsets.only(left: 30, right: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Sign in or sign up by phone",
                style: TextStyle(
                    color: Colors.white54,
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 15,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, LoginOtpScreen.routeName);
                },
                child: Container(
                  padding: const EdgeInsets.only(top: 8, bottom: 8),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.white),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Image.asset(
                          'assets/images/nation/ic_vietnam.png',
                          width: 30,
                          height: 30,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 5),
                        child: const Text('+84'),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: const Text(
                          "Input my phone number",
                          style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              InkWell(
                onTap: () {},
                child: const Text(
                  "Sign in Account",
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 14),
                ),
              )
            ],
          ));
    }

    Widget bottomScreen() {
      return Container(
          margin: const EdgeInsets.only(bottom: 20),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 30, right: 30),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                        child: Container(
                      height: 1,
                      color: Colors.white,
                    )),
                    const SizedBox(
                      width: 5,
                    ),
                    const Text(
                      "Or sign in with",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Flexible(
                        child: Container(
                      height: 1,
                      color: Colors.white,
                    )),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  ButtonGoogle(
                    onTap: () {
                      authBloc.add(AuthenticationGoogle());
                    },
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  ButtonFaceBook(onTap: () {
                    authBloc.add(AuthenticationFacebook());
                  })
                ]),
              )
            ],
          ));
    }

    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xff5490f8),
                      Color(0xff4c70f6),
                      Color(0xff2852ef),
                      Color(0xff2650ea),
                      Color(0xff2851e5),
                      Color(0xff1a42d9),
                      // Color(0xff1260e8),
                      // Color(0xff1260e8),
                    ])),
          ),
          Positioned(top: 15, left: 0, right: 0, child: topScreen()),
          Positioned(child: middleScreen()),
          Positioned(left: 0, bottom: 0, right: 0, child: bottomScreen())
        ],
      ),
    ));
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
