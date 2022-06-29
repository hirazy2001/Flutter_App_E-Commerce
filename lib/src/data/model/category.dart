import 'package:flutter/foundation.dart';

class Category {
  String id;
  String idProduct;
  String color;
  String payload;

  Category(
      {required this.id,
      required this.idProduct,
      required this.color,
      required this.payload});

  factory Category.fromJson(Map<String, dynamic> json) => Category(
      id: json["id"],
      idProduct: json["idProduct"],
      color: json["color"],
      payload: json["payload"]);
}
