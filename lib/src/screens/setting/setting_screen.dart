import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  static const String routeName = "/setting";

  @override
  SettingScreenState createState() {
    return SettingScreenState();
  }
}

class SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Container(
            padding: const EdgeInsets.all(5),
            child: Image.asset(
              "assets/images/ic_back.png",
              width: 25,
              height: 25,
            ),
          ),
        ),
        title: const Text(
          "Account Setting",
          style: TextStyle(
            color: Colors.black,
            fontSize: 17,
            fontWeight: FontWeight.w600
          ),
        ),
      ),
      body: Column(
        children: [],
      ),
    ));
  }
}
