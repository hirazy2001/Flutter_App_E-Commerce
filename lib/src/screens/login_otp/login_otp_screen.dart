import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_e_commerce/src/bloc/authentication/authentication_event.dart';
import 'package:flutter_app_e_commerce/src/bloc/authentication/authentication_state.dart';
import 'package:flutter_app_e_commerce/src/common/common.dart';
import 'package:flutter_app_e_commerce/src/common/constants.dart';
import 'package:flutter_app_e_commerce/src/data/model/request/otp_request.dart';
import 'package:flutter_app_e_commerce/src/helper/app_utils.dart';
import 'package:flutter_app_e_commerce/src/screens/otp/otp_screen.dart';
import 'package:flutter_app_e_commerce/src/widgets/app_bar_screen.dart';
import 'package:flutter_app_e_commerce/src/widgets/dialog_loading.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:sms_autofill/sms_autofill.dart';

import '../../bloc/authentication/authentication_bloc.dart';
import '../../data/model/arguments/otp_argument.dart';
import '../../widgets/button_material.dart';

class LoginOtpScreen extends StatefulWidget {
  static const String routeName = "/login_otp";

  @override
  LoginOtpScreenState createState() {
    return LoginOtpScreenState();
  }
}

class LoginOtpScreenState extends State<LoginOtpScreen> {
  late FocusNode focusNode;
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  bool isValid = true;
  bool isPhone = true;

  @override
  void initState() {
    focusNode = FocusNode();
    focusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    var authBloc = BlocProvider.of<AuthenticationBloc>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(
          () {
            Navigator.pop(context);
          },
          isPhone,
          () {
            print("AppBar Hello");
            setState(() {
              isPhone = false;
            });
          }),
      body: BlocListener<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          if (state is OtpSendingState) {
            DialogLoading.showDialogLoading(context);
          } else {
            if (state is OtpErrorState) {
              print("Otp Error");
            } else {
              print("Otp Success");
            }
            // Navigator.of(context).pop();
            // Navigator.popUntil(context, (route) => route.isFirst);
            Navigator.popAndPushNamed(context, OtpScreen.routName,
                arguments: OtpArgument(emailOrPhone: _controller.text));
            // Get.back();
          }
        },
        child: SafeArea(
          child: Container(
            margin: const EdgeInsets.all(20),
            child: Stack(
              children: [
                isPhone
                    ? Column(
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            child: const Text(
                              "Enter phone number",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Container(
                            child: const Text(
                              "Verification code will be sent to your phone number",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 10),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: isValid
                                        ? Colors.transparent
                                        : Colors.red,
                                    width: 1.0),
                                color: Colors.black12,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10))),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(width: 10),
                                const Image(
                                    height: 25,
                                    width: 25,
                                    image: AssetImage(
                                        'assets/images/nation/ic_vietnam.png')),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Text(
                                  '+84',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                      fontSize: 15),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                    child: PhoneFieldHint(
                                  autoFocus: true,
                                  controller: _controller,
                                  child: TextField(
                                    controller: _controller,
                                    autofocus: true,
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Enter your phone number',
                                    ),
                                  ),
                                  // inputFormatters: [
                                  //   FilteringTextInputFormatter.deny(RegExp('123')),
                                  //   FilteringTextInputFormatter.deny(RegExp(r'[/\\]'))
                                  // ],
                                ))
                              ],
                            ),
                          )
                        ],
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "What is address of Email?",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "We will send code to your email.",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            decoration: const BoxDecoration(
                                color: Colors.black12,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Container(
                              margin: const EdgeInsets.only(left: 15),
                              child: TextField(
                                controller: _emailController,
                                autofocus: true,
                                decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintStyle: TextStyle(color: Colors.black26),
                                    hintText: "Enter your email"),
                              ),
                            ),
                          ),
                        ],
                      ),
                Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: isPhone
                        ? Column(
                            children: [
                              ButtonMaterial(
                                text: "Continue",
                                onClick: () {
                                  if (true) {
                                    authBloc.add(AuthenticationPhoneRequestOtp(
                                        otpRequest: OtpRequest(
                                            phone: "+84" +
                                                _controller.text.trim())));
                                  } else {
                                    setState(() {
                                      isValid = false;
                                    });
                                  }
                                },
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              RichText(
                                  textAlign: TextAlign.left,
                                  text: TextSpan(text: 'Hello', children: [
                                    const TextSpan(
                                        text: Constants.NOTE_OTP_PHONE,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400)),
                                    TextSpan(
                                        recognizer: TapGestureRecognizer()
                                          ..onTap =
                                              () => print('Tap Here onTap'),
                                        text: 'Terms of services',
                                        style: const TextStyle(
                                          color: Colors.blue,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400,
                                          decoration: TextDecoration.underline,
                                        )),
                                    const TextSpan(
                                        text: ' and ',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400)),
                                    TextSpan(
                                        recognizer: TapGestureRecognizer()
                                          ..onTap =
                                              () => print('Tap Here onTap'),
                                        text: 'Privacy Policies',
                                        style: const TextStyle(
                                          color: Colors.blue,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400,
                                          decoration: TextDecoration.underline,
                                        )),
                                    const TextSpan(
                                        text: ' of us.',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400)),
                                  ]))
                            ],
                          )
                        : Column(children: [
                            ButtonMaterial(
                              text: "Continue",
                              onClick: () {
                                String str = _emailController.text.trim();
                                print("Email " + str);
                                if (AppUtils.regexStr(str, Common.REGEX_EMAIL)){
                                  authBloc.add(AuthenticationEmailRequestOtp(
                                      otpRequest: OtpRequest(email: str)));
                                }
                                else{

                                }
                              },
                            )
                          ]))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
