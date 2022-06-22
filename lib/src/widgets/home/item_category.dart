import 'package:flutter/material.dart';

import '../../data/model/item_category.dart';

class ItemCategoryWidget extends StatelessWidget {
  Function() onTap;
  ItemCategory itemCategory;

  ItemCategoryWidget(
      {Key? key, required this.itemCategory, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(color: itemCategory.color,
                  borderRadius: const BorderRadius.all(Radius.circular(35))),
              child: Image(
                width: 25,
                height: 25,
                image: AssetImage(itemCategory.icon),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              itemCategory.category,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            )
          ],
        ),
      ),
    );
  }
}
