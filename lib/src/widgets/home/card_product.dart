import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../data/model/product.dart';

class CardProduct extends StatelessWidget {
  Product product;
  Function() onClick;

  CardProduct({required this.product, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
        child: Card(
      elevation: 0,
      color: Colors.white,
      child: Container(
        padding: const EdgeInsets.only(bottom: 10),
        child: Column(
          children: [
            CachedNetworkImage(imageUrl: product.image!),
            Container(
              margin: const EdgeInsets.only(left: 5, right: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name!,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.left,
                    maxLines: 2,
                  ),
                  Text(
                    product.price,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  Row(
                    children: [
                      const Image(
                        width: 18,
                        height: 18,
                        image: AssetImage("assets/images/ic_star_rating.png"),
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      RichText(
                          text: TextSpan(text: "", children: [
                        TextSpan(
                            text: product.rating.toString(),
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w500)),
                        TextSpan(
                            text: " (${product.sold.toString()})",
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w300)),
                      ])),
                      Row(
                        children: [
                          Text(""),
                        ],
                      )
                      // Text(
                      //   product.rating.toString(),
                      //   style: const TextStyle(
                      //     fontWeight: FontWeight.w500,
                      //     fontSize: 12,
                      //   ),
                      // ),
                      // Text(
                      //   product.rating.toString(),
                      //   style: const TextStyle(
                      //     fontWeight: FontWeight.w700,
                      //     fontSize: 12,
                      //   ),
                      // )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
