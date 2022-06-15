import 'package:flutter/material.dart';

class AccountWidget extends StatefulWidget{

  @override
  AccountWidgetState createState() {
    return AccountWidgetState();
  }
}

class AccountWidgetState extends State<AccountWidget>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Account",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w400
          ),
        ),
      ),
    );
  }
}