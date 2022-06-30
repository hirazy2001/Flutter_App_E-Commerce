import 'package:flutter_app_e_commerce/src/data/model/resource.dart';
import 'package:flutter_app_e_commerce/src/data/model/review.dart';

class Product {
  String? id;
  String? name;
  String? shop;
  String price;
  String? image;
  int sold;
  List<Resource>? images;
  List<Review> reviews;
  double rating;

  Product({required this.id,
    required this.name,
    required this.shop,
    required this.price,
    required this.image,
    required this.rating,
    required this.sold,
    required this.reviews,
    required this.images});

  factory Product.fromJson(Map<String, dynamic> json) =>
      Product(id: json["id"],
          name: json["name"],
          shop: json["shop"],
          price: json["price"],
          image: json["image"],
          rating: json["rating"],
          sold: json["sold"],
          reviews: List<Review>.from(
              json["reviews"].map((x) => Review.fromJson(x))),
          images: List<Resource>.from(
              json["reviews"].map((x) => Resource.fromJson(x))));
}

List<Product> products = [
  Product(
      id: "1",
      name: "Balo 1",
      shop: "shop",
      image: "https://cf.shopee.vn/file/3d27f158461d840be18ea6221b55e0ae_tn",
      images: [],
      reviews: [
        Review(
            userId: "12212",
            userName: "GG",
            rating: 5,
            content: "OK san pham nhu cc",
            picture: "https://cf.shopee.vn/file/3d27f158461d840be18ea6221b55e0ae_tn",
            createdAt: DateTime.now()
        ),
        Review(
            userId: "12212",
            userName: "GG",
            rating: 5,
            content: "OK san pham nhu cc",
            picture: "https://cf.shopee.vn/file/3d27f158461d840be18ea6221b55e0ae_tn",
            createdAt: DateTime.now()
        ),
        Review(
            userId: "12212",
            userName: "GG",
            rating: 5,
            content: "OK san pham nhu cc",
            picture: "https://cf.shopee.vn/file/3d27f158461d840be18ea6221b55e0ae_tn",
            createdAt: DateTime.now()
        ),
        Review(
            userId: "12212",
            userName: "GG",
            rating: 5,
            content: "OK san pham nhu cc",
            picture: "https://cf.shopee.vn/file/3d27f158461d840be18ea6221b55e0ae_tn",
            createdAt: DateTime.now()
        )
      ],
      sold: 120,
      rating: 4.6,
      price: "35"),
  Product(
      id: "1",
      name: "Ao phong 1",
      shop: "shop",
      sold: 40,
      image: "https://cf.shopee.vn/file/c9e9a86cb516014c552b96a9ff0bf8d5",
      images: [],
      reviews: [
        Review(
            userId: "12212",
            userName: "GG",
            rating: 5,
            content: "OK san pham nhu cc",
            picture: "https://cf.shopee.vn/file/3d27f158461d840be18ea6221b55e0ae_tn",
            createdAt: DateTime.now()
        )
      ],
      rating: 4.6,
      price: "35"),
  Product(
      id: "1",
      name: "Balo 2",
      shop: "shop",
      image: "https://cf.shopee.vn/file/3d27f158461d840be18ea6221b55e0ae_tn",
      images: [],
      reviews: [
        Review(
            userId: "12212",
            userName: "GG",
            rating: 5,
            content: "OK san pham nhu cc",
            picture: "https://cf.shopee.vn/file/3d27f158461d840be18ea6221b55e0ae_tn",
            createdAt: DateTime.now()
        )
      ],
      rating: 4.6,
      sold: 20,
      price: "35"),
  Product(
      id: "1",
      name: "Ao phong 2",
      shop: "shop",
      image: "https://cf.shopee.vn/file/3d27f158461d840be18ea6221b55e0ae_tn",
      images: [],
      reviews: [
        Review(
            userId: "12212",
            userName: "GG",
            rating: 5,
            content: "OK san pham nhu cc",
            picture: "https://cf.shopee.vn/file/3d27f158461d840be18ea6221b55e0ae_tn",
            createdAt: DateTime.now()
        )
      ],
      rating: 4.6,
      sold: 30,
      price: "35"),
  Product(
      id: "1",
      name: "Balo 3",
      shop: "shop",
      image: "https://cf.shopee.vn/file/8493b4eefb7251e49ea0dd829690d584",
      images: [],
      reviews: [
        Review(
            userId: "12212",
            userName: "GG",
            rating: 5,
            content: "OK san pham nhu cc",
            picture: "https://cf.shopee.vn/file/3d27f158461d840be18ea6221b55e0ae_tn",
            createdAt: DateTime.now()
        )
      ],
      rating: 4.6,
      sold: 300,
      price: "35"),
];
