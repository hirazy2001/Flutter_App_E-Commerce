import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SliderDots extends StatelessWidget {
  bool isActive;

  SliderDots({required this.isActive});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin: EdgeInsets.symmetric(horizontal: 3.3),
      duration: const Duration(microseconds: 150),
      height: isActive ? 10 : 6,
      width: isActive ? 10 : 6,
      decoration: BoxDecoration(
          color: isActive ? Colors.white : Colors.grey,
          border: isActive
              ? Border.all(color: const Color(0xff927DFF), width: 0.2)
              : Border.all(color: Colors.transparent, width: 1),
          borderRadius: const BorderRadius.all(Radius.circular(12))
      ),);
  }
}
