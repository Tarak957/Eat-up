import 'package:flutter/material.dart';
import 'package:food_app/home_screen/home_screen.dart';

class CartProvider extends ChangeNotifier {
  List<Item> cartItems = [];

  void toggleCart(Item item) {
    final isExist = cartItems.contains(item);
    if (isExist) {
      cartItems.remove(item);
      notifyListeners();
    } else {
      cartItems.add(item);
      notifyListeners();
    }
  }

  void clearCart() {
    cartItems.clear();
  }

  bool isExist(Item item) {
    final isExist = cartItems.contains(item);
    return isExist;
  }
}
