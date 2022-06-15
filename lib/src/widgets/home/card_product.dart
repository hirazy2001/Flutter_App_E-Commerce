import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../data/model/product.dart';

class CardProduct extends StatelessWidget {
  Product product;

  CardProduct({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Column(
        children: [
          CachedNetworkImage(imageUrl: product.image!),
          Container(
            margin: const EdgeInsets.only(left: 5, right: 5),
            child: Column(
              children: [
                Text(
                  product.name!,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                  maxLines: 2,
                ),
                Text(
                  product.price,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
