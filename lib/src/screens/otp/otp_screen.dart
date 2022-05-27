import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sms_autofill/sms_autofill.dart';

import '../../data/model/arguments/otp_argument.dart';
import '../../widgets/app_bar_screen.dart';

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

  @override
  void initState() {
    super.initState();
    listenForCode();

    SmsAutoFill().getAppSignature.then((signature) {
      setState(() {
        appSignature = signature;
      });
    });
  }

  @override
  void dispose() {
    SmsAutoFill().unregisterListener();
    super.dispose();
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
                    margin: EdgeInsets.all(20),
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
                                  textStyle: TextStyle(
                                      fontSize: 16, color: Colors.limeAccent),
                                  strokeColorBuilder: FixedColorBuilder(
                                    Colors.blue,
                                  ),
                                  bgColorBuilder:
                                      FixedColorBuilder(Colors.blue.shade100),
                                  strokeWidth: 1,
                                )
                                //   textStyle:
                                //       const TextStyle(fontSize: 20, color: Colors.black),
                                //   colorBuilder:
                                //       FixedColorBuilder(Colors.black.withOpacity(0.3)),
                                // ),
                                // currentCode: _code,
                                // onCodeSubmitted: (code) {},
                                // onCodeChanged: (code) {
                                //   if (code!.length == 6) {
                                //     FocusScope.of(context).requestFocus(FocusNode());
                                //   }
                                // },
                                ),
                            //   controller:,
                            //   inputFormatters: [],
                            // ),
                          )
                        ],
                      )),
                      Positioned(
                          bottom: 0,
                          child: Column(
                            children: [
                              RichText(
                                  text:
                                      const TextSpan(text: 'Hello', children: [
                                TextSpan(
                                    text: '${1}',
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500)),
                                TextSpan(
                                    text: 's',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400))
                              ]))
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
