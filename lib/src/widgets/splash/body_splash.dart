import 'package:flutter/cupertino.dart';

import '../../common/constants.dart';

class BodySplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: Column(
        children: [
          Row(
            children: [
              Container(
                child: Image.asset(
                  'assets/images/ic_github.png',
                  width: 30,
                  height: 30,
                ),
              ),
              Text(Constants.APP_NAME)
            ],
          ),
          const Text(
            Constants.TITLE_SPLASH,
            style: TextStyle(),
          )
        ],
      ),
    ));
  }
}
