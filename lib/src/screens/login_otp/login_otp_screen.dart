import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_e_commerce/src/bloc/authentication/authentication_event.dart';
import 'package:flutter_app_e_commerce/src/bloc/authentication/authentication_state.dart';
import 'package:flutter_app_e_commerce/src/common/common.dart';
import 'package:flutter_app_e_commerce/src/common/constants.dart';
import 'package:flutter_app_e_commerce/src/data/model/request/otp_request.dart';
import 'package:flutter_app_e_commerce/src/screens/otp/otp_screen.dart';
import 'package:flutter_app_e_commerce/src/widgets/app_bar_screen.dart';
import 'package:flutter_app_e_commerce/src/widgets/dialog_loading.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:sms_autofill/sms_autofill.dart';

import '../../bloc/authentication/authentication_bloc.dart';
import '../../data/model/arguments/otp_argument.dart';

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
  bool isValid = true;

  @override
  void initState() {
    focusNode = new FocusNode();
    focusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    var authBloc = BlocProvider.of<AuthenticationBloc>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(() {
        Navigator.pop(context);
      }, true, () {}),
      body: BlocListener<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          if (state is OtpSendingState) {
            DialogLoading.showDialogLoading(context);
          } else {
            print("Otp Error");
            // Navigator.of(context).pop();
            // Navigator.popUntil(context, (route) => route.isFirst);
            Navigator.popAndPushNamed(context, OtpScreen.routName, arguments: OtpArgument(
              emailOrPhone: _controller.text
            ));
            // Get.back();
          }
        },
        child: SafeArea(
          child: Container(
            margin: const EdgeInsets.all(20),
            child: Stack(
              children: [
                Column(
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
                      margin: EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: isValid ? Colors.transparent : Colors.red,
                              width: 1.0),
                          color: Colors.black12,
                          borderRadius: const BorderRadius.all(Radius.circular(10))),
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
                            child: const TextField(
                              autofocus: true,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Enter your phone number',
                              ),
                            ),
                            inputFormatters: [
                              FilteringTextInputFormatter.deny(RegExp('123')),
                              FilteringTextInputFormatter.deny(RegExp(r'[/\\]'))
                            ],
                          ))
                        ],
                      ),
                    )
                  ],
                ),
                Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Column(
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 0.0,
                            primary: Colors.red.withOpacity(0),
                            shape: ContinuousRectangleBorder(
                                borderRadius: BorderRadius.circular(1),
                                side: const BorderSide(color: Colors.white)),
                          ),
                          onPressed: () {
                            // final regexp = RegExp(Common.REGEX_PHONE_NUMBER_VN);
                            // final match = regexp.hasMatch("+84" + _controller.text);

                            if (true) {
                              authBloc.add(AuthenticationPhoneRequestOtp(
                                  otpRequest: OtpRequest(
                                      phone: _controller.text.trim())));
                            } else {
                              setState(() {
                                isValid = false;
                              });
                            }
                          },
                          child: Ink(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(colors: [
                                Color.fromARGB(255, 224, 110, 75),
                                Color.fromARGB(255, 196, 15, 60),
                                Color.fromARGB(255, 179, 2, 172),
                              ]),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(80.0)),
                            ),
                            child: Container(
                              padding:
                                  const EdgeInsets.only(top: 12, bottom: 12),
                              alignment: Alignment.center,
                              child: const Text(
                                "Send SMS OTP",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18),
                              ),
                            ),
                          ),
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
                                    ..onTap = () => print('Tap Here onTap'),
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
                                    ..onTap = () => print('Tap Here onTap'),
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
                        // RichText(
                        //     text: const TextSpan(text: 'Hello', children: [
                        //   TextSpan(
                        //       text: '${1}',
                        //       style: TextStyle(
                        //           color: Colors.red,
                        //           fontSize: 14,
                        //           fontWeight: FontWeight.w500)),
                        //   TextSpan(
                        //       text: 's',
                        //       style: TextStyle(
                        //           color: Colors.black,
                        //           fontSize: 13,
                        //           fontWeight: FontWeight.w400))
                        // ]))
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
