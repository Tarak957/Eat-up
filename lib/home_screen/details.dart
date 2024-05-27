import 'package:flutter/material.dart';
//import 'package:food_app/home_screen/home_screen.dart';
import 'package:food_app/bottom_navigation%20_bar/main_screen.dart';
//import 'package:food_app/providers/cart_provider.dart';
//import 'package:provider/provider.dart';

class Details extends StatelessWidget {
  final String itemName;
  final String itemPrice;
  final String itemImagePath;

  Details({
    required this.itemName,
    required this.itemPrice,
    required this.itemImagePath,
  });

  @override
  Widget build(BuildContext context) {
    // var cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(20),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Home(),
                ),
              );
            },
            child: const Icon(Icons.arrow_back),
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 400,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(itemImagePath), fit: BoxFit.cover),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              itemName,
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          Text(
            '\$$itemPrice',
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          // Padding(
          //   padding: const EdgeInsets.only(top: 20),
          //   child: ElevatedButton(
          //     style: ElevatedButton.styleFrom(
          //         shape: RoundedRectangleBorder(
          //           borderRadius: BorderRadius.circular(25),
          //         ),
          //         backgroundColor: Colors.amber[900]),
          //     onPressed: () {
          //       Item newItem = Item(itemName, itemPrice, itemImagePath);
          //       cartProvider.toggleCart(newItem);
          //       ScaffoldMessenger.of(context).showSnackBar(
          //         SnackBar(
          //           content: Text(
          //             '$itemName added to cart',
          //           ),
          //           duration: const Duration(seconds: 2),
          //         ),
          //       );
          //       // Navigator.push(
          //       //   context,
          //       //   MaterialPageRoute(
          //       //     builder: (context) => const Cart(),
          //       //   ),
          //       // );
          //     },
          //     child: const Padding(
          //       padding: EdgeInsets.all(15),
          //       child: Text(
          //         'Add item',
          //         style: TextStyle(color: Colors.white, fontSize: 20),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
