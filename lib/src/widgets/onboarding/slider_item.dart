import 'package:flutter/cupertino.dart';
import 'package:flutter_app_e_commerce/src/data/model/slider.dart';
import 'package:google_fonts/google_fonts.dart';

class SliderItem extends StatelessWidget {
  final int index;

  SliderItem({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Slider slider = sliderList[index];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.6,
          width: MediaQuery.of(context).size.width * 0.4,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage(
              slider.sliderImageUrl,
            ),
          )),
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          slider.sliderHeading,
          style: GoogleFonts.alice(
            color: const Color.fromARGB(100, 83, 82, 82)
          ),
        ),

        Text(
          slider.sliderHeading,
          style: GoogleFonts.alice(
              color: const Color.fromARGB(100, 83, 82, 82)
          ),
        )
      ],
    );
  }
}
