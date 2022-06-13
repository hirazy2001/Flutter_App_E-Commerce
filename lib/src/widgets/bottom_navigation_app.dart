import 'package:flutter/material.dart';
import 'package:flutter_app_e_commerce/src/common/constants.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class BottomNavigationApp extends StatelessWidget {
  final Function(int) onClick;

  late AnimationController _controller;

  BottomNavigationApp({Key? key, required this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SalomonBottomBar(currentIndex: 0, onTap: onClick, items: [
      SalomonBottomBarItem(
        icon: const Image(
          image: AssetImage("assets/images/"),
        ),
        title: const Text(
          Constants.ITEM_HOME,
          style: TextStyle(
              fontWeight: FontWeight.w400, fontSize: 12, color: Colors.black26),
        ),
        // activeIcon: AnimatedIcon(
        //   icon: Icons._AnimatedIconData,
        //   progress: _controller,
        // )
      ),
      SalomonBottomBarItem(
          icon: const Image(
            image: AssetImage("assets/images/ic_chat.png"),
          ),
          title: const Text(
            Constants.ITEM_HOME,
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: Colors.black26),
          ),
          activeIcon: const Image(
            image: AssetImage("assets/images/ic_chat_active.png"),
          )),
      SalomonBottomBarItem(
          icon: const Image(
            image: AssetImage("assets/images/ic_cart_active.png"),
          ),
          title: const Text(
            Constants.ITEM_HOME,
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: Colors.black26),
          ),
          activeIcon: const Image(
            image: AssetImage("assets/images/ic_cart_active.png"),
          )),
      SalomonBottomBarItem(
          icon: const Image(
            image: AssetImage("assets/images/account.png"),
          ),
          title: const Text(
            Constants.ITEM_HOME,
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: Colors.black26),
          ),
          activeIcon: const Image(
            image: AssetImage("assets/images/ic_account_active.png"),
          )),
    ]);
  }
}
