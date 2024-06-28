import 'package:a2ecommerceapp/data/models/products.dart';

class Cart {
  static List<ProductModel> _items = [];

  // Method to add an item to the cart
  static void addToCart(ProductModel item) {
    _items.add(item);
  }

  // Method to remove an item from the cart
  static void removeItem(ProductModel item) {
    _items.remove(item);
  }

  // Getter to access the cart items
  static List<ProductModel> get items => _items;
}
