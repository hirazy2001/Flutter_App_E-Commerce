import 'package:flutter/material.dart';

class ItemSetting extends StatelessWidget{

  String option;
  ItemSetting({Key? key, required this.option}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          option,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 15,
            color: Colors.black
          ),
        )
      ],
    );
  }
}