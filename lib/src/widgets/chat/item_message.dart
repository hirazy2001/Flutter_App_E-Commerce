import 'package:flutter/material.dart';
import 'package:flutter_app_e_commerce/src/data/model/message.dart';

class ItemMessage extends StatelessWidget{

  Message message;

  Function() onClick;

  ItemMessage({Key? key, required this.message, required this.onClick}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [],
    );
  }


}