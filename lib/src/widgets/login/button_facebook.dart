import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonFaceBook extends StatelessWidget {
  Function() onTap;

  ButtonFaceBook({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          width: 50,
          height: 50,
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.white, spreadRadius: 0.3, blurRadius: 5)
            ],
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(40)),
          ),
          child: const Image(
            image: AssetImage('assets/images/ic_facebook.png'),
          )),
    );
  }
}
