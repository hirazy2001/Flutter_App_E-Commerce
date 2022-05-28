import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_e_commerce/src/widgets/button_material.dart';

import '../../common/constants.dart';
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
                  const Text(
                    "Create Account",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text("Please Enter Your Username and Password",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      )),
                  Container(
                    decoration: const BoxDecoration(
                      color: Constants.colorInput,
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    child: Row(
                      children: [
                        TextFormField(),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            child: const Image(
                              width: 25,
                              height: 25,
                              image: AssetImage(Constants.icRemove),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: Constants.colorInput,
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    child: Row(
                      children: [
                        TextFormField(),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            child: const Image(
                              width: 25,
                              height: 25,
                              image: AssetImage(Constants.icRemove),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            child: const Image(
                              width: 25,
                              height: 25,
                              image: AssetImage(Constants.icRemove),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: "Username",
                      filled: true,
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                    validator: (value) {},
                  )
                ],
              ),
              Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Column(
                    children: [
                      RichText(
                        text: const TextSpan(
                            text: "I agree with Hirazy's ",
                            children: [
                              TextSpan(
                                  text: "Terms of Service",
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.blue)),
                              TextSpan(
                                  text:
                                      "and my private data is process with Hirazy",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black)),
                              TextSpan(
                                  text: "Privacy Policy",
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.blue))
                            ]),
                      ),
                      ButtonMaterial(
                          text: "Agree and Create Account", onClick: () {
                            
                      })
                    ],
                  ))
            ],
          ),
        )));
  }
}
