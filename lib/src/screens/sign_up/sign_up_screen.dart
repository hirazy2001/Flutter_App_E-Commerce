import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/app_bar_screen.dart';

class SignUpScreen extends StatefulWidget {
  @override
  SignUpScreenState createState() {
    return SignUpScreenState();
  }
}

class SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(() {}),
        body: SafeArea(
            child: Container(
          margin: const EdgeInsets.all(20),
          child: Stack(
            children: [
              Column(
                children: [
                  Text(
                    "Create Account",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              )
            ],
          ),
        )));
  }
}
