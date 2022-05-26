import 'package:flutter/cupertino.dart';

import '../../common/constants.dart';

class BodySplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Center(
      child: Column(
        children: [
          Row(
            children: [
               Container(
                child: Image.asset(''),
              ),
              const Text(Constants.APP_NAME)
            ],
          ),
          Text(Constants.TITLE_SPLASH)
        ],
      ),
    ));
  }
}
