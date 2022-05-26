import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonGoogle extends StatelessWidget {
  Function() onTap;

  ButtonGoogle({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          padding: const EdgeInsets.all(10),
          width: 50,
          height: 50,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(25)),
          ),
          child: Container(
            decoration: const BoxDecoration(color: Colors.white, boxShadow: [
              // BoxShadow(color: Color(0xFF8745DF), offset: Offset(0.0, 5.0))
            ]),
            width: 30,
            height: 30,
            child: const Image(
              image: AssetImage('assets/images/ic_google.png'),
            ),
          )),
    );
  }
}
