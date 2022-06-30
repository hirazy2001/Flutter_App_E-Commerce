import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class DialogExit extends StatelessWidget {
  Function() cancel;
  Function() exit;

  DialogExit({Key? key, required this.exit, required this.cancel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        children: [
          const Text(
            "Do you want to exit app?",
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Row(
              children: [
                InkWell(
                  onTap: cancel,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    child: const Text(
                      "NO",
                      style: TextStyle(color: Color.fromARGB(255, 48, 198, 14)),
                    ),
                  ),
                ),
                InkWell(
                  onTap: exit,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    child: const Text(
                      "YES",
                      style: TextStyle(color: Color.fromARGB(255, 48, 198, 14)),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
