import 'package:flutter_app_e_commerce/src/data/model/product_view.dart';
import 'package:flutter_app_e_commerce/src/data/repository/product_repository.dart';

class ProductRepositoryImpl extends ProductRepository{

  @override
  void addFavorite(String productId) {
  }

  @override
  void addToCart(String productId) {
  }

  @override
  List<ProductView> getAllProductView() {
    throw UnimplementedError();
  }

}