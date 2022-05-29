import 'package:flutter/material.dart';

class ButtonMaterial extends StatelessWidget {

  final String text;
  final Function() onClick;

  ButtonMaterial({Key? key, required this.text, required this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   height: 50.0,
    //   child: RaisedButton(
    //     onPressed: onClick,
    //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
    //     padding: EdgeInsets.all(0.0),
    //     child: Ink(
    //       decoration: BoxDecoration(
    //           gradient: LinearGradient(colors: [Color(0xff374ABE), Color(0xff64B6FF)],
    //             begin: Alignment.centerLeft,
    //             end: Alignment.centerRight,
    //           ),
    //           borderRadius: BorderRadius.circular(30.0)
    //       ),
    //       child: Container(
    //         constraints: BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
    //         alignment: Alignment.center,
    //         child: Text(
    //           text,
    //           textAlign: TextAlign.center,
    //           style: TextStyle(
    //               color: Colors.white,
    //             fontWeight: FontWeight.w400,
    //             fontSize: 18
    //           ),
    //         ),
    //       ),
    //     ),
    //   ),
    // );
    //   ElevatedButton(
    //   style: ElevatedButton.styleFrom(
    //     elevation: 0.0,
    //     primary: Colors.red.withOpacity(0),
    //     shape: ContinuousRectangleBorder(
    //         borderRadius: BorderRadius.circular(1),
    //         side: const BorderSide(color: Colors.white)),
    //   ),
    //   onPressed: onClick,
    //   child: Ink(
    //     decoration: const BoxDecoration(
    //       gradient: LinearGradient(colors: [
    //         Color.fromARGB(255, 224, 110, 75),
    //         Color.fromARGB(255, 196, 15, 60),
    //         Color.fromARGB(255, 179, 2, 172),
    //       ]),
    //       borderRadius: BorderRadius.all(Radius.circular(80.0)),
    //     ),
    //     child: Container(
    //       padding: const EdgeInsets.only(top: 12, bottom: 12),
    //       alignment: Alignment.center,
    //       child: const Text(
    //         "Send SMS OTP",
    //         style: TextStyle(
    //             color: Colors.white, fontWeight: FontWeight.w500, fontSize: 18),
    //       ),
    //     ),
    //   ),
    // );
    return GestureDetector(
      onTap: onClick,
      child: Container(
        height: 45,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.teal,
              Colors.teal.shade200,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(5, 5),
              blurRadius: 10,
            )
          ],
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
