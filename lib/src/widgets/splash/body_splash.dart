import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../common/constants.dart';

class BodySplash extends StatelessWidget {
  const BodySplash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // FractionallySizedBox(
              //   heightFactor: 0.4,
              //   child:
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Image.asset(
                      'assets/images/ic_github.png',
                      width: 40,
                      height: 40,
                    ),
                  ),
                  Text(
                    Constants.APP_NAME,
                    style: GoogleFonts.aleo().copyWith(
                        fontSize: 18,
                        foreground: Paint()..shader = Constants.shaderGradient),
                  )
                ],
              ),
              // ),
              Text(Constants.TITLE_SPLASH,
                  style: GoogleFonts.amarante().copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  )
                  // TextStyle(
                  //   fontWeight: FontWeight.w500,
                  //   fontSize: 16,
                  // ),
                  ),
              DefaultTextStyle(
                  style: const TextStyle(
                    fontSize: 40.0,
                    fontFamily: 'Horizon',
                  ),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      RotateAnimatedText('AWESOME'),
                      RotateAnimatedText('OPTIMISTIC'),
                      RotateAnimatedText(
                        'DIFFERENT',
                        textStyle: const TextStyle(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                    onTap: () {},
                    isRepeatingAnimation: true,
                    totalRepeatCount: 10,
                  ))
            ],
          ),
        ));
  }
}
