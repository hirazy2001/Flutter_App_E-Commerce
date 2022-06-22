import 'package:flutter/material.dart';
import 'package:flutter_app_e_commerce/src/data/model/review.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ItemReview extends StatelessWidget {
  Review review;

  ItemReview({Key? key, required this.review}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Row(
        children: [
          Image.network(review.picture),
          const SizedBox(
            width: 10,
          ),
          Column(
            children: [
              Text(
                review.userName,
                style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                    color: Colors.black),
              ),
              RatingBarIndicator(
                itemBuilder: (context, index) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                rating: review.rating as double,
                itemCount: 5,
                itemSize: 14,
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: Text(
                  review.content,
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
