import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sms_autofill/sms_autofill.dart';

import '../../data/model/arguments/otp_argument.dart';
import '../../widgets/app_bar_screen.dart';
import '../../widgets/button_material.dart';

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
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: appBar(() {
          /**
           * Remove All Screen until meet Route
           */
          Navigator.of(context).popUntil((route) => route.isFirst);
        }),
        body: WillPopScope(
            onWillPop: () {
              Navigator.popUntil(context, (route) => route.isFirst);

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
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            maxLines: 2,
                            textAlign: TextAlign.left,
                          ),
                          const Text(
                            "Please enter code contains 6 numbers:",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                            maxLines: 2,
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            widget.emailOrPhone.emailOrPhone,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 12,
                            ),
                          ),
                          Center(
                            child: PinFieldAutoFill(
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
                              RichText(
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
                                            fontWeight: FontWeight.w500)),
                                    const TextSpan(
                                        text: 's',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400))
                                  ])),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ButtonMaterial(
                                    text: "Continue",
                                    onClick: () {


                                    },
                                  )
                                ],
                              )
                            ],
                          ))
                    ])))));
  }

  @override
  void codeUpdated() {
    setState(() {
      otpCode = code!;
    });
  }
}
