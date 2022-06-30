import '../model/product_view.dart';

abstract class ProductRepository{
  List<ProductView> getAllProductView();

  void addFavorite(String productId);

  void addToCart(String productId);
}