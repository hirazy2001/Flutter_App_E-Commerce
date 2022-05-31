import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//bool isActions = false,
AppBar appBar(Function() onTap,
    [bool isActions = false, Function()? onTapActions]) {
  return AppBar(
    systemOverlayStyle: const SystemUiOverlayStyle(
      // Status bar color
      statusBarColor: Colors.white,
      // Status bar brightness (optional)
      statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
      statusBarBrightness: Brightness.light, // For iOS (dark icons)
    ),
    backgroundColor: Colors.white,
    bottomOpacity: 0.0,
    elevation: 0.0,
    leading: MaterialButton(
      onPressed: onTap,
      child: const Image(
        width: 35,
        height: 35,
        image: AssetImage('assets/images/ic_back.png'),
      ),
    ),
    actions: isActions == false
        ? []
        : [
            Container(
              margin: const EdgeInsets.only(right: 15),
              child: PopupMenuButton<int>(
                  child: const Image(
                    width: 20,
                    height: 20,
                    image: AssetImage('assets/images/ic_menu.png'),
                  ),
                  onSelected:
                    onTapActions!(),
                  itemBuilder: (context) => [
                        const PopupMenuItem<int>(
                            child: Text(
                          "Sign up by Email",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 13,
                              color: Colors.black),
                        ))
                      ]),
            )
          ],
  );
}
