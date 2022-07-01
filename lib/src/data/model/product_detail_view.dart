import 'dart:convert';

import 'package:flutter_app_e_commerce/src/data/model/product.dart';
import 'package:flutter_app_e_commerce/src/data/model/product_view.dart';
import 'package:flutter_app_e_commerce/src/data/model/review.dart';

class ProductDetailView {
  Product product;
  List<ProductView> productViews;

  ProductDetailView({required this.product, required this.productViews});

}

ProductDetailView tempProductView = ProductDetailView(
    product: Product(
        id: "1",
        name: "Balo 1",
        shop: "shop",
        image: "https://cf.shopee.vn/file/3d27f158461d840be18ea6221b55e0ae_tn",
        images: [],
        characteristics: [
          "Thương hiệu: OEM",
          "THÔNG TIN SẢN PHẨM",
          "Đường may cẩn thận",
          "Sản xuất tại Việt Nam"
        ],
        reviews: [
          Review(
              userId: "12212",
              userName: "GG",
              rating: 5,
              content: "OK san pham nhu cc",
              picture:
                  "https://cf.shopee.vn/file/3d27f158461d840be18ea6221b55e0ae_tn",
              createdAt: DateTime.now()),
        ],
        sold: 120,
        rating: 4.6,
        price: "35"),
    productViews: productViews);
