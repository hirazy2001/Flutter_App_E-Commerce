import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_e_commerce/src/bloc/otp/otp_bloc.dart';
import 'package:flutter_app_e_commerce/src/bloc/otp/otp_state.dart';
import 'package:flutter_app_e_commerce/src/data/model/request/otp_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sms_autofill/sms_autofill.dart';

import '../../bloc/otp/otp_event.dart';
import '../../config/app_routes.dart';
import '../../data/model/arguments/otp_argument.dart';
import '../../widgets/app_bar_screen.dart';
import '../../widgets/button_material.dart';
import '../../widgets/dialog_loading.dart';
import '../login/login_screen.dart';

class OtpScreen extends StatefulWidget {
  static const String routName = '/otp';

  final OtpArgument emailOrPhone;

  OtpScreen({required this.emailOrPhone});

  @override
  OtpScreenState createState() {
    return OtpScreenState();
  }
}

class OtpScreenState extends State<OtpScreen> with CodeAutoFill {
  String? appSignature;
  String? otpCode;
  String _code = "";
  int indexOtp = 0;
  late Timer _timer;
  int _start = 60;

  @override
  void initState() {
    super.initState();
    listenForCode();

    startTimer();

    SmsAutoFill().getAppSignature.then((signature) {
      print("Signature App " + signature);
      setState(() {
        appSignature = signature;
      });
    });
  }

  @override
  void dispose() {
    SmsAutoFill().unregisterListener();
    _timer.cancel();
    super.dispose();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (timer) {
      if (_start == 0) {
        setState(() {
          timer.cancel();
        });
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var authOtpBloc = BlocProvider.of<OtpBloc>(context);

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: appBar(() {
          /**
           * Remove All Screen until meet Route
           */
          // Navigator.of(context).popUntil((route) => route.isFirst);
          Navigator.pop(context);
        }),
        body: BlocListener<OtpBloc, OtpState>(
          listener: (BuildContext context, state) {
            if (state is OtpRequest) {
              DialogLoading.showDialogLoading(context);
            } else if (state is OtpAuthSuccess) {
              Navigator.pop(context);
              Navigator.pushReplacement(
                  context,
                  AppRoutes.generateRoute(
                      RouteSettings(name: LoginScreen.routeName)));
            } else {
              // OtpAuthFailed
              Navigator.pop(context);
            }
          },
          child: WillPopScope(
              onWillPop: () {
                // Navigator.popUntil(context, (route) => route.isFirst);
                Navigator.pop(context);
                return Future.value(true);
              },
              child: SafeArea(
                  child: Container(
                      margin: const EdgeInsets.all(20),
                      child: Stack(children: [
                        Container(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Enter OTP Code",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                              maxLines: 2,
                              textAlign: TextAlign.left,
                            ),
                            const Text(
                              "Please enter code contains 6 numbers:",
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                              maxLines: 2,
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              "+84 " + widget.emailOrPhone.emailOrPhone,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 15,
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Center(
                              child: PinFieldAutoFill(
                                  onCodeChanged: (p0) {
                                    if (p0!.length == 6) {
                                      print("Hello");
                                      authOtpBloc.add(OtpAuthEvent(
                                          otpAuth: OtpAuth(
                                              otp: p0,
                                              email: widget
                                                  .emailOrPhone.emailOrPhone,
                                              phone: widget
                                                  .emailOrPhone.emailOrPhone)));
                                    }
                                  },
                                  onCodeSubmitted: (p0) {},
                                  keyboardType: TextInputType.number,
                                  codeLength: 6,
                                  decoration: BoxLooseDecoration(
                                    textStyle: const TextStyle(
                                        fontSize: 16, color: Colors.limeAccent),
                                    strokeColorBuilder: PinListenColorBuilder(
                                        Colors.blue, Colors.transparent),
                                    bgColorBuilder: PinListenColorBuilder(
                                        Colors.blue.shade100, Colors.black12),
                                    strokeWidth: 1,
                                  )),
                            )
                          ],
                        )),
                        Positioned(
                            left: 0,
                            right: 0,
                            bottom: 0,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _start == 0
                                    ? RichText(
                                        text: TextSpan(
                                            text: 'Send Otp Again',
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 13,
                                                fontWeight: FontWeight.w400),
                                            children: [
                                            TextSpan(
                                                text: ' ${_start}',
                                                style: const TextStyle(
                                                    color: Colors.red,
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                            const TextSpan(
                                                text: 's',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.w400))
                                          ]))
                                    : InkWell(
                                        onTap: () {},
                                        child: const Text(
                                          "Verification code not received?",
                                          style: TextStyle(
                                              color: Colors.blue,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                const SizedBox(
                                  height: 10,
                                ),
                                ButtonMaterial(
                                  text: "Continue",
                                  onClick: () {},
                                )
                              ],
                            ))
                      ])))),
        ));
  }

  @override
  void codeUpdated() {
    setState(() {
      otpCode = code!;
    });
  }
}
