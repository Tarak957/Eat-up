import 'package:flutter/material.dart';
import 'package:food_app/home_screen/details.dart';
import 'package:food_app/providers/cart_provider.dart';
import 'package:food_app/providers/fav_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class Item {
  final String name;
  final String price;
  final String imgpath;
  Item(this.name, this.price, this.imgpath);
}

class Category {
  final String name;
  final List<Item> items;

  Category(this.name, this.items);
}

final List<Category> categories = [
  Category(
    'Burger',
    [
      Item('Veg Burger', '5', 'assets/images/burger1.png'),
      Item('Cheese Burger', '7', 'assets/images/burger2.png'),
      Item('Paneer Burger', '9', 'assets/images/burger3.png'),
      Item('Spicy Burger', '8', 'assets/images/burger4.png'),
    ],
  ),
  Category(
    'Pizza',
    [
      Item('Veg Pizza', '10', 'assets/images/pizza1.png'),
      Item('Cheese Pizza', '8', 'assets/images/pizza2.png'),
      Item('Paneer Pizza', '9', 'assets/images/pizza3.png'),
      Item('Onion Pizza', '7', 'assets/images/pizza4.png'),
    ],
  ),
  Category(
    'Fries',
    [
      Item('Plain Fries', '6', 'assets/images/fries1.png'),
      Item('Garlic Fries', '7', 'assets/images/fries2.png'),
      Item('Peri periFries', '8', 'assets/images/fries3.png'),
      Item('Masala Fries', '9', 'assets/images/fries4.png'),
    ],
  ),
];

class _HomeScreenState extends State<HomeScreen> {
  int? selected = 0;
  List<List<Color>> fav =
      List.generate(categories.length, (index) => List.filled(4, Colors.grey));
  List<List<Color>> cart =
      List.generate(categories.length, (index) => List.filled(4, Colors.grey));

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var favProvider = Provider.of<FavProvider>(context);
    var cartProvider = Provider.of<CartProvider>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20, top: 10, bottom: 10),
          child: Text(
            "Categories",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: SizedBox(
            height: 55,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(
                      () {
                        selected = index;
                      },
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 108,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: selected == index
                            ? Colors.amber[900]
                            : Colors.white,
                      ),
                      child: Center(
                        child: Text(
                          categories[index].name,
                          style: TextStyle(
                            color:
                                selected == index ? Colors.white : Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        if (selected != null)
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    mainAxisExtent: 260),
                itemCount: categories[selected!].items.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Details(
                            itemName: categories[selected!].items[index].name,
                            itemPrice: categories[selected!].items[index].price,
                            itemImagePath:
                                categories[selected!].items[index].imgpath,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        boxShadow: const [BoxShadow(color: Colors.white)],
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(
                                () {
                                  favProvider.toggleFavorite(
                                      categories[selected!].items[index]);
                                },
                              );
                            },
                            icon: favProvider.isFavorite(
                                    categories[selected!].items[index])
                                ? const Icon(
                                    Icons.favorite,
                                    color: Colors.pink,
                                  )
                                : const Icon(Icons.favorite_border),
                          ),
                          Image.asset(
                            categories[selected!].items[index].imgpath,
                            fit: BoxFit.fitHeight,
                            height: 120,
                            width: double.infinity,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  categories[selected!].items[index].name,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(
                                () {
                                  cartProvider.toggleCart(
                                      categories[selected!].items[index]);
                                },
                              );
                            },
                            icon: cartProvider
                                    .isExist(categories[selected!].items[index])
                                ? Icon(Icons.add_shopping_cart,
                                    color: Colors.amber[900])
                                : const Icon(Icons.add_shopping_cart_outlined),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
      ],
    );
  }
}
