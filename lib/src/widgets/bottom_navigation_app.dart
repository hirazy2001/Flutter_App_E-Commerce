import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavigationApp extends StatelessWidget {
  final Function() onClick;

  BottomNavigationApp({required this.onClick});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(items: []);
  }
}
