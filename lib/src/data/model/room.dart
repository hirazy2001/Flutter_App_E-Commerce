import 'package:flutter_app_e_commerce/src/data/model/shop_view.dart';
import 'package:flutter_app_e_commerce/src/data/model/user.dart';

import 'message.dart';

class Room {
  String id;
  UserLocal userLocal;
  ShopView shopView;
  List<Message> messages;

  Room(
      {required this.id,
      required this.messages,
      required this.shopView,
      required this.userLocal});
}
