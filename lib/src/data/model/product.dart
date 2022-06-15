class Product {
  String? id;
  String? name;
  String? shop;
  String price;
  String? image;
  List<String>? images;

  Product(
      {required this.id,
      required this.name,
      required this.shop,
      required this.price,
      required this.image,
      required this.images});
}

List<Product> products = [
  Product(id: "1", name: "", shop: "shop", image: "https://cf.shopee.vn/file/3d27f158461d840be18ea6221b55e0ae_tn", images: ["image"], price: "35"),
  Product(id: "1", name: "", shop: "shop", image: "https://cf.shopee.vn/file/3d27f158461d840be18ea6221b55e0ae_tn", images: ["image"], price: "35"),
];
