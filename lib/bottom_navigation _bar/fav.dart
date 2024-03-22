import 'package:flutter/material.dart';
import 'package:food_app/home_screen/home_screen.dart';
import 'package:food_app/providers/cart_provider.dart';
import 'package:food_app/providers/fav_provider.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class Favorites extends StatefulWidget {
  Favorites({super.key});

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    final favProvider = Provider.of<FavProvider>(context);
    final cartProvider = Provider.of<CartProvider>(context);

    return Column(
      children: [
        const Align(
          alignment: Alignment.topCenter,
          child: Text(
            "Favorites",
            style: TextStyle(fontSize: 25),
          ),
        ),
        favProvider.favoriteItems.isEmpty
            ? Lottie.asset('assets/Lotties/empty.json', height: 300)
            : Expanded(
                child: ListView.builder(
                  itemCount: favProvider.favoriteItems.length,
                  itemBuilder: (context, index) {
                    Item currentItem = favProvider.favoriteItems[index];
                    return ListTile(
                      title: Text(currentItem.name),
                      leading: Image.asset(
                        currentItem.imgpath,
                        height: 40,
                        width: 40,
                      ),
                      trailing: SizedBox(
                        width: 100,
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                favProvider.toggleFavorite(currentItem);
                                setState(() {});
                              },
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(
                                  () {
                                    cartProvider.toggleCart(currentItem);
                                  },
                                );
                              },
                              icon: cartProvider.isExist(currentItem)
                                  ? Icon(Icons.add_shopping_cart,
                                      color: Colors.amber[900])
                                  : const Icon(
                                      Icons.add_shopping_cart_outlined),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
      ],
    );
  }
}
