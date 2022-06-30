import 'package:flutter/material.dart';

class BottomSheetDetail extends StatelessWidget {
  const BottomSheetDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints:
            BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 3 /4),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
          const Center(
            child: Text(
              "Characteristics",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ),
          Expanded(
              child: SingleChildScrollView(
                  child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 10),
                child: itemCharacteristic(),
              )
            ],
          )))
        ]));
  }

  Widget itemCharacteristic() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Brand",
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.w500, color: Colors.black),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10, left: 5),
          child: Row(
            children: [],
          ),
        )
      ],
    );
  }
}
