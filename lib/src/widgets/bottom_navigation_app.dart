import 'package:flutter/material.dart';
import 'package:flutter_app_e_commerce/src/common/constants.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class BottomNavigationApp extends StatelessWidget {
  final Function(int) onClick;
  int currentIndex;

  late AnimationController _controller;

  BottomNavigationApp(
      {Key? key, required this.currentIndex, required this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SalomonBottomBar(currentIndex: currentIndex, onTap: onClick, items: [
      SalomonBottomBarItem(
          icon: const Image(
            width: Constants.SIZE_ITEM_NAV,
            height: Constants.SIZE_ITEM_NAV,
            image: AssetImage("assets/images/ic_home.png"),
          ),
          title: const Text(
            Constants.ITEM_HOME,
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: Colors.black26),
          ),
          activeIcon: const Image(
            width: Constants.SIZE_ITEM_NAV,
            height: Constants.SIZE_ITEM_NAV,
            image: AssetImage("assets/images/ic_home_active.png"),
          )),
      SalomonBottomBarItem(
          icon: const Image(
            width: Constants.SIZE_ITEM_NAV,
            height: Constants.SIZE_ITEM_NAV,
            image: AssetImage("assets/images/ic_chat.png"),
          ),
          title: const Text(
            Constants.ITEM_MESSAGE,
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: Colors.black26),
          ),
          activeIcon: const Image(
            width: Constants.SIZE_ITEM_NAV,
            height: Constants.SIZE_ITEM_NAV,
            image: AssetImage("assets/images/ic_chat_active.png"),
          )),
      SalomonBottomBarItem(
          icon: const Image(
            width: Constants.SIZE_ITEM_NAV,
            height: Constants.SIZE_ITEM_NAV,
            image: AssetImage("assets/images/ic_cart.png"),
          ),
          title: const Text(
            Constants.ITEM_CART,
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: Colors.black26),
          ),
          activeIcon: const Image(
            width: Constants.SIZE_ITEM_NAV,
            height: Constants.SIZE_ITEM_NAV,
            image: AssetImage("assets/images/ic_cart_active.png"),
          )),
      SalomonBottomBarItem(
          icon: const Image(
            width: Constants.SIZE_ITEM_NAV,
            height: Constants.SIZE_ITEM_NAV,
            image: AssetImage("assets/images/ic_account.png"),
          ),
          title: const Text(
            Constants.ITEM_ACCOUNT,
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: Colors.black26),
          ),
          activeIcon: const Image(
            width: Constants.SIZE_ITEM_NAV,
            height: Constants.SIZE_ITEM_NAV,
            image: AssetImage("assets/images/ic_account_active.png"),
          )),
    ]);
  }
}
