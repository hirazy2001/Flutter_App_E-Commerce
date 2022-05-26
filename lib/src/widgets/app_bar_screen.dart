import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

AppBar appBar(Function() onTap) {
  return AppBar(
      leading: MaterialButton(
    onPressed: onTap,
    child: const Image(
      width: 35,
      height: 35,
      image: AssetImage('assets/images/ic_back.png'),
    ),
  ), actions: [

  ],);
}
