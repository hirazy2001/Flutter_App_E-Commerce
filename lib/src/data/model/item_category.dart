import 'dart:ui';

import 'package:flutter/material.dart';

class ItemCategory{
  Color color;
  int id;
  String icon; // Load from assets image of app
  String category;

  ItemCategory({required this.color, required this.id, required this.icon, required this.category});
}


List<ItemCategory> itemCategories = [
  ItemCategory(color: const Color.fromARGB(30, 46, 255, 0), id: 1, icon: "assets/images/ic_fashion.png", category: "Fashion"),
  ItemCategory(color: const Color.fromARGB(30, 250, 115, 10), id: 2, icon: "assets/images/ic_electronics.png", category: "Electronic"),
  ItemCategory(color: const Color.fromARGB(30, 35, 246, 81), id: 3, icon: "assets/images/ic_appliances.png", category: "Appliances"),
  ItemCategory(color: const Color.fromARGB(30, 10, 202, 250), id: 4, icon: "assets/images/ic_beauty.png", category: "Beauty"),
  ItemCategory(color: const Color.fromARGB(30, 19, 80, 236), id: 5, icon: "assets/images/ic_furniture.png", category: "Furniture"),
  ItemCategory(color: const Color.fromARGB(30, 231, 107, 11), id: 6, icon: "assets/images/ic_motorbike.png", category: "Motorbike"),
];