import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class DialogLoading {
  static void showDialogLoading(
    BuildContext context,
  ) {
    showDialog(
        context: context,
        builder: (_) {
          return WillPopScope(
              child: SimpleDialog(
                backgroundColor: Colors.transparent,
                children: [
                  Lottie.asset('assets/raw/anim_loading.json', width: 55, height: 55),
                ],
              ),
              onWillPop: () async => false);
        });
  }
}
