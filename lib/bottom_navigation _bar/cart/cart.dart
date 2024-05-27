import 'package:flutter/material.dart';
import 'package:food_app/home_screen/home_screen.dart';
import 'package:food_app/providers/cart_provider.dart';
import 'package:food_app/bottom_navigation%20_bar/cart/track.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<CartProvider>(context);

    return Column(
      children: [
        const Align(
          alignment: Alignment.topCenter,
          child: Text(
            "Cart",
            style: TextStyle(fontSize: 25),
          ),
        ),
        cartProvider.cartItems.isEmpty
            ? Lottie.asset('assets/Lotties/empty.json', height: 300)
            : Expanded(
                child: ListView.builder(
                  itemCount: cartProvider.cartItems.length,
                  itemBuilder: (context, index) {
                    Item currentItem = cartProvider.cartItems[index];
                    return ListTile(
                      title: Text(currentItem.name),
                      leading: Image.asset(
                        currentItem.imgpath,
                        height: 40,
                        width: 40,
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          cartProvider.toggleCart(currentItem);
                          setState(() {});
                        },
                        icon: Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                      ),
                    );
                  },
                ),
              ),
        if (!cartProvider.cartItems.isEmpty)
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  backgroundColor: Colors.amber[900]),
              onPressed: () {
                cartProvider.clearCart();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Track(),
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Order Placed',
                    ),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  'Place Order',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
