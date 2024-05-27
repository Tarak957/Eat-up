import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:food_app/login/login.dart';
import 'package:food_app/bottom_navigation%20_bar/main_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Skip extends StatefulWidget {
  const Skip({super.key});

  @override
  State<Skip> createState() => _SkipState();
}

class _SkipState extends State<Skip> {
  final PageController pageController = PageController(initialPage: 0);
  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  bool? isLoggedIn;

  void checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: pageController,
            children: List.generate(
              3,
              (index) => _buildPage(
                image: _getImageForIndex(index),
                title: _getTitleForIndex(index),
              ),
            ),
          ),
          Positioned(
            top: 40,
            right: 20,
            child: TextButton(
              onPressed: () {
                isLoggedIn == true
                    ? Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Home(),
                        ),
                      )
                    : Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Login(),
                        ),
                      );
              },
              child: const SafeArea(
                child: Text(
                  'Skereytip',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 100,
            left: 0,
            right: 0,
            child: AnimatedBuilder(
              animation: pageController,
              builder: (context, child) {
                return Center(
                  child: DotsIndicator(
                    dotsCount: 3,
                    position: (pageController.page ?? 0).toInt(),
                    decorator: DotsDecorator(
                      color: Colors.grey,
                      activeColor: Colors.amber[900],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber[900],
        onPressed: () {
          final nextPage = (pageController.page ?? 0).toInt() + 1;
          if (nextPage < 3) {
            pageController.animateToPage(
              nextPage,
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
            );
          } else {
            isLoggedIn == true
                ? Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Home(),
                    ),
                  )
                : Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Login(),
                    ),
                  );
          }
        },
        child: const Icon(
          Icons.arrow_forward,
          color: Colors.white,
        ),
      ),
    );
  }

  String _getImageForIndex(int index) {
    switch (index) {
      case 0:
        return 'assets/images/noodles.png';
      case 1:
        return 'assets/images/cooking.png';
      case 2:
        return 'assets/images/delivery.jpg';
      default:
        return '';
    }
  }

  String _getTitleForIndex(int index) {
    switch (index) {
      case 0:
        return 'Amazing food at\nyour doorstep';
      case 1:
        return 'Cooked by an amazing\nchef';
      case 2:
        return 'Quick and fastest\ndelivery';
      default:
        return '';
    }
  }

  Widget _buildPage({
    required String image,
    required String title,
  }) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 120),
          child: Image.asset(image, width: 390, height: 400),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              title,
              softWrap: true,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}
