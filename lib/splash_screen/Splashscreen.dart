import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:food_app/welcome_screen/skip.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 2),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Skip()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[900],
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            PictureView(img: 'assets/images/coffee-cup.png', left: 230),
            PictureView(img: 'assets/images/popsicle.png', left: 30),
            PictureView(img: 'assets/images/fries.png', left: 270),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      "Eat Up!!",
                      textStyle: const TextStyle(
                          fontSize: 45,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                      speed: const Duration(milliseconds: 80),
                    )
                  ],
                  isRepeatingAnimation: true,
                  repeatForever: true,
                )
              ],
            ),
            PictureView(img: 'assets/images/pizza.png', left: 40),
            PictureView(img: 'assets/images/drink.png', left: 260),
            PictureView(img: 'assets/images/chicken-leg.png', left: 150),
            PictureView(img: 'assets/images/doughnut.png', left: 270),
            PictureView(img: 'assets/images/hot-dog.png', left: 20),
            PictureView(img: 'assets/images/ice-cream.png', left: 200)
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class PictureView extends StatelessWidget {
  PictureView({super.key, required this.img, required this.left});

  final String img;
  double left;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(left: left),
          child: Image.asset(img, width: 50, height: 50, color: Colors.white),
        ),
      ].animate(
        effects: [
          const FadeEffect(),
          const ScaleEffect(),
        ],
      ),
    );
  }
}
