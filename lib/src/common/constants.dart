import 'dart:ui';

import 'package:flutter/material.dart';

class Constants {
  /// CONFIG
  static const String APP_NAME = "Hirazy";
  static const String CHANNEL = "com.example.init_app";
  static const String FACEBOOK_APP_ID = "";
  static const String BASE_URL = "http://192.168.21.101:9000/api/v1/";
  static const String MASTER_KEY = "zLVkc8QrSynbOOTNvjHH3im7a03etWlS";
  static const String TITLE_SPLASH = "Start your shopping with Hirazy";

  /// FONTS
  static const String FONT_LAPSUS_PRO = "LapsusPro";
  static const String FONT_POPPINS = "Poppins";

  /// SLIDER
  static const String NEXT = "Next";
  static const String SKIP = "Skip";
  static const String FINISH = "Finish";

  static const String SLIDER_HEADING_1 = "Easy to purchase!";
  static const String SLIDER_HEADING_2 = "Hello 123";
  static const String SLIDER_HEADING_3 = "Hello 123";

  static const String SLIDER_DESC1 = "Purchase easily with Hirazy";
  static const String SLIDER_DESC2 = "Hello 123";
  static const String SLIDER_DESC3 = "Hello 123";

  /// STRING
  static const String NOTE_OTP_PHONE =
      "Please note that by creating and/or use user account, you agree to ";

  static const String ITEM_HOME = "Home";
  static const String ITEM_STREAM = "Stream";
  static const String ITEM_MESSAGE = "Message";
  static const String ITEM_CART = "Cart";
  static const String ITEM_ACCOUNT = "Account";

  /// COLOR
  static const Color colorInput = Colors.black26;

  /// SIZE
  static const double SIZE_ITEM_NAV = 22;

  /// GRADIENT TEXT
  static Shader shaderGradient = const LinearGradient(
          colors: <Color>[Color(0xffDA44bb), Color(0xff8921aa)])
      .createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  /// TEXT HTML GENDER DESCRIPTION
  static const String FILE_HTML_PRODUCT = '''
          # Minimal Markdown Test
          ---
          This is a simple Markdown test. Provide a text string with Markdown tags
          to the Markdown widget and it will display the formatted output in a scrollable
          widget.
          ## Section 1
          Maecenas eget **arcu egestas**, mollis ex vitae, posuere magna. Nunc eget
           aliquam tortor. Vestibulum porta sodales efficitur. Mauris interdum turpis
           eget est condimentum, vitae porttitor diam ornare.
          ### Subsection A
          Sed et massa finibus, blandit massa vel, vulputate velit. Vestibulum vitae
          venenatis libero. ***Curabitur sem lectus, feugiat eu justo in, eleifend
          accumsan ante.*** Sed a fermentum elit. Curabitur sodales metus id mi ornare,
          in ullamcorper magna congue.  
          ![Alt text](https://images.unsplash.com/photo-1477959858617-67f85cf4f1df?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Y2l0eXxlbnwwfHwwfHw%3D&w=1000&q=80 "a title")
          ''';

  /// IMAGE
  static const String icShow = 'assets/images/ic_show.png';
  static const String icHide = 'assets/images/ic_hide.png';
  static const String icRemove = 'assets/images/ic_remove/png';
  static const String icShare = 'assets/images/ic_share.png';
  static const String icUnFavorite = 'assets/images/ic_unfavorite.png';
  static const String icFavorite = 'assets/images/ic_favorite.png';
  static const String icStarRating = "assets/images/ic_star_rating.png";
  static const String urlAvatar = "https://scontent.fhan2-4.fna.fbcdn.net/v/t1.6435-9/142915405_106600208107240_8287176908190349092_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=nA_AiTnU4ZQAX9E46_O&_nc_ht=scontent.fhan2-4.fna&oh=00_AT-UhCKIyX125fWhTWeHh_MhULGhbhJxjkdaUjGvv-bY4g&oe=62E51706";

  static const PRODUCT_ITEMS = [
    "https://scontent.fhan2-4.fna.fbcdn.net/v/t1.6435-9/142915405_106600208107240_8287176908190349092_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=cC0pk4MenwsAX9oOapY&_nc_ht=scontent.fhan2-4.fna&oh=00_AT8wDaK0sjSH5Z3gxmHkGYotDquO_PJln2iIcqpbe7_TqA&oe=62D54506"
  ];
}
