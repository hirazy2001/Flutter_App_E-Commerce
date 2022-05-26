import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemInput extends StatelessWidget {
  String hint;

  ItemInput({Key? key, required this.hint}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(

            ),
          ),
          focusedBorder: OutlineInputBorder(
          ),
          hintText: hint
        ),
      ),
    );
  }
}
