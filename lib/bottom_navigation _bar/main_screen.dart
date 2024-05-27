import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_app/bottom_navigation%20_bar/cart/cart.dart';
import 'package:food_app/bottom_navigation%20_bar/fav.dart';
import 'package:food_app/bottom_navigation%20_bar/profile.dart';
import 'package:food_app/home_screen/home_screen.dart';
import 'package:food_app/login/login.dart';
import 'package:food_app/providers/cart_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  List pages = [];
  final scaffoldKey = GlobalKey<ScaffoldState>();

  File? _image;
  final picker = ImagePicker();

  Future getImage(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  Future<void> showOptions() async {
    await showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        actions: [
          CupertinoActionSheetAction(
            child: const Text('Gallery'),
            onPressed: () {
              Navigator.of(context).pop();
              getImage(ImageSource.gallery);
            },
          ),
          CupertinoActionSheetAction(
            child: const Text('Camera'),
            onPressed: () {
              Navigator.of(context).pop();
              getImage(ImageSource.camera);
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.orange[100],
      appBar: AppBar(
        backgroundColor: Colors.orange[100],
        leading: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: IconButton(
            onPressed: () {
              scaffoldKey.currentState!.isDrawerOpen
                  ? scaffoldKey.currentState!.closeDrawer()
                  : scaffoldKey.currentState!.openDrawer();
            },
            icon: Icon(Icons.grid_view_rounded, color: Colors.amber[900]),
          ),
        ),
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: const [
          HomeScreen(),
          Favorites(),
          Cart(),
          ProfilePage(),
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.amber[900],
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.amber[900],
              ),
              child: Padding(
                padding: const EdgeInsets.all(40),
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                  child: IconButton(
                    onPressed: showOptions,
                    icon: _image != null
                        ? Image.file(
                            _image!,
                            fit: BoxFit.cover,
                          )
                        : const Icon(Icons.image),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 500),
              child: DrawerList(
                title: 'Log Out',
                onTap: () async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.remove('phoneNumber');
                  prefs.remove('otp');
                  prefs.setBool('isLoggedIn', false);

                  // ignore: use_build_context_synchronously
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Logged Out Successfully'),
                      duration: Duration(seconds: 1),
                    ),
                  );

                  // Navigate to login screen
                  Navigator.pushReplacement(
                    // ignore: use_build_context_synchronously
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Login(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.amber[900],
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: cartProvider.cartItems.isNotEmpty
                ? Badge(
                    smallSize: 10,
                    largeSize: 15,
                    backgroundColor: Colors.black,
                    label: Text(
                      cartProvider.cartItems.length.toString(),
                    ),
                    child: const Icon(Icons.shopping_cart),
                  )
                : const Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

class DrawerList extends StatelessWidget {
  const DrawerList({super.key, required this.title, this.onTap});

  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Center(
        child: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      onTap: onTap,
    );
  }
}
