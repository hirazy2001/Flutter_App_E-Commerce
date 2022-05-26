import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ErrorScreen extends StatefulWidget{
  @override
  ErrorScreenState createState() {
    return new ErrorScreenState();
  }

}

class ErrorScreenState extends State<ErrorScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("Error")
        ],
      ),
    );
  }

}