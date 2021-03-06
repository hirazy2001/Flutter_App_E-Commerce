import 'package:flutter_app_e_commerce/src/common/constants.dart';

class Slider {
  final String sliderImageUrl;
  final String sliderHeading;
  final String sliderSubHeading;

  Slider(
      {required this.sliderImageUrl,
      required this.sliderHeading,
      required this.sliderSubHeading});
}

List<Slider> sliderList = [
  Slider(sliderImageUrl: 'assets/images/slider_1.png', sliderHeading: Constants.SLIDER_HEADING_1, sliderSubHeading: Constants.SLIDER_DESC1),
  Slider(sliderImageUrl: 'assets/images/slider_2.png', sliderHeading: Constants.SLIDER_HEADING_2, sliderSubHeading: Constants.SLIDER_DESC2),
  Slider(sliderImageUrl: 'assets/images/slider_3.png', sliderHeading: Constants.SLIDER_HEADING_3, sliderSubHeading: Constants.SLIDER_DESC3),
];