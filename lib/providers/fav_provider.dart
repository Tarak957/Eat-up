import 'package:flutter/material.dart';
import 'package:food_app/home_screen/home_screen.dart';

class FavProvider extends ChangeNotifier {
  List<Item> favoriteItems = [];

  void toggleFavorite(Item item) {
    final isFavorite = favoriteItems.contains(item);
    if (isFavorite) {
      favoriteItems.remove(item);
      notifyListeners();
    } else {
      favoriteItems.add(item);
      notifyListeners();
    }
  }

  bool isFavorite(Item item) {
    final isFavorite = favoriteItems.contains(item);
    return isFavorite;
  }
}
