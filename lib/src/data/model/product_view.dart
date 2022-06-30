class ProductView {
  String? id;
  String? name;
  String? shop;
  String price;
  String? image;
  int sold;
  double reviews;
  double rating;

  ProductView({required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.shop,
    required this.sold,
    required this.reviews,
    required this.rating});

  factory ProductView.fromJson(Map<String, dynamic> json) =>
      ProductView(id: json["id"],
          name: json["name"],
          image: json["image"],
          price: json["price"],
          shop: json["shop"],
          sold: json["sold"],
          reviews: json["reviews"],
          rating: json["rating"]);
}

List<ProductView> productViews = [
  ProductView(
      id: "1",
      name: "Balo 1",
      shop: "shop",
      image: "https://cf.shopee.vn/file/8493b4eefb7251e49ea0dd829690d584",
      sold: 120,
      rating: 4.6,
      reviews: 300,
      price: "37"),
  ProductView(
      id: "2",
      name: "Balo 2",
      shop: "shop",
      image: "https://cf.shopee.vn/file/3d27f158461d840be18ea6221b55e0ae_tn",
      sold: 300,
      rating: 4.3,
      reviews: 250,
      price: "100"),
  ProductView(
      id: "3",
      name: "Balo 3",
      shop: "shop",
      image: "https://cf.shopee.vn/file/c9e9a86cb516014c552b96a9ff0bf8d5",
      sold: 17,
      rating: 4.6,
      reviews: 22,
      price: "78"),
  ProductView(
      id: "4",
      name: "Balo 4",
      shop: "shop",
      image: "https://cf.shopee.vn/file/3d27f158461d840be18ea6221b55e0ae_tn",
      sold: 15,
      rating: 4.6,
      reviews: 300,
      price: "46"),
  ProductView(
      id: "5",
      name: "Balo 5",
      shop: "shop",
      image: "https://cf.shopee.vn/file/3d27f158461d840be18ea6221b55e0ae_tn",
      sold: 120,
      rating: 4.6,
      reviews: 300,
      price: "40"),
];
