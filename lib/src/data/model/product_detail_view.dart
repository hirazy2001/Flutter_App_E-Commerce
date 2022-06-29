import 'package:flutter_app_e_commerce/src/data/model/product.dart';
import 'package:flutter_app_e_commerce/src/data/model/product_view.dart';

class ProductDetailView{
  Product product;
  List<ProductView> productViews;

  ProductDetailView({required this.product, required this.productViews});
}