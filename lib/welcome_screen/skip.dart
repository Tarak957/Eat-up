// import 'package:dots_indicator/dots_indicator.dart';
// import 'package:flutter/material.dart';
// import 'package:food_app/login.dart';

// class Skip extends StatefulWidget {
//   const Skip({super.key});

//   @override
//   State<Skip> createState() => _SkipState();
// }

// class _SkipState extends State<Skip> {

//   final PageController pagecontroller=PageController(initialPage: 0);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: PageView(
//         controller: pagecontroller,
//           children: [
//             Column(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(top:25,left:270),
//                   child: TextButton(
//                     onPressed: () {
//                       Navigator.push(
//                         context, MaterialPageRoute(
//                           builder: (context) => const login(),
//                         ),
//                       );
//                     },
//                     child:
//                     const SafeArea(
//                       child: Text('Skip',
//                         style: TextStyle(
//                           fontSize: 20,
//                           color: Colors.black),
//                         ),
//                     ),
//                   ),
//                 ),
//                 Image.asset('assets/images/noodles.png',width: 390,height: 400,),

//                 const Center(
//                   child: Text("Amazing food at your doorstep",
//                   style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold
//                     ),
//                   ),
//                 ),

//                 SizedBox(height: 20,),

//                 DotsIndicator(
//                   dotsCount: 3,
//                   position: 0,
//                   decorator: DotsDecorator(
//                     color: Colors.grey,
//                     activeColor: Colors.amber[900],
//                   ),
//                 ),
//                 SizedBox(height: 50,),

//                 ElevatedButton(
//                   style:
//                     ElevatedButton.styleFrom(
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(25)
//                       ),
//                       backgroundColor: Colors.amber[900],
//                     ),
//                     onPressed: () {
//                       if(pagecontroller.hasClients){
//                         pagecontroller.animateToPage(
//                             1,
//                             duration: const Duration(milliseconds: 400),
//                             curve: Curves.easeInOut,
//                         );
//                       }
//                     }, child: Padding(
//                   padding: const EdgeInsets.symmetric(vertical:25.0),
//                   child: Image.asset('assets/images/right-arrow.png',width: 10,height: 10,color: Colors.white,),
//                 ),
//               ),
//             ],
//           ),

//             Column(
//               children: [
//                 AppBar(
//                   leading: GestureDetector(
//                     onTap: () {
//                       if(pagecontroller.hasClients){
//                         pagecontroller.animateToPage(
//                             0,
//                             duration: const Duration(milliseconds: 400),
//                             curve: Curves.easeInOut,
//                         );
//                       }
//                     }, child: Icon(Icons.arrow_back),
//                   ),

//                   actions: <Widget>[
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.push(
//                           context, MaterialPageRoute(
//                             builder: (context) => const login(),
//                           ),
//                         );
//                       },
//                       child: const Padding(
//                         padding: EdgeInsets.only(right:25.0),
//                         child: Text("Skip",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
//                       ),
//                     )
//                   ],
//                 ),
//                 Image.asset('assets/images/cooking.png',width: 390,height: 400,),

//                 const Center(
//                   child: Text("Cooked by amazing chef",
//                   softWrap: true,
//                   style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold),),
//                 ),
//                 SizedBox(height: 20,),

//                 DotsIndicator(
//                   dotsCount: 3,
//                   position: 1,
//                   decorator: DotsDecorator(
//                     color: Colors.grey,
//                     activeColor: Colors.amber[900],
//                   ),
//                 ),
//                 SizedBox(height: 50,),

//                 ElevatedButton(
//                   style:
//                     ElevatedButton.styleFrom(
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(25)
//                       ),
//                       backgroundColor: Colors.amber[900],
//                     ),
//                     onPressed: () {
//                       if(pagecontroller.hasClients){
//                         pagecontroller.animateToPage(
//                             2,
//                             duration: const Duration(milliseconds: 400),
//                             curve: Curves.easeInOut,
//                         );
//                       }
//                     }, child: Padding(
//                   padding: const EdgeInsets.symmetric(vertical:25.0),
//                   child: Image.asset('assets/images/right-arrow.png',width: 10,height: 10,color: Colors.white,),
//                 ),
//               ),
//             ],
//           ),

//           Column(
//               children: [
//                 AppBar(
//                   leading: GestureDetector(
//                     onTap: () {
//                       if(pagecontroller.hasClients){
//                         pagecontroller.animateToPage(
//                             1,
//                             duration: const Duration(milliseconds: 400),
//                             curve: Curves.easeInOut,
//                         );
//                       }
//                     }, child: Icon(Icons.arrow_back),
//                   ),

//                   actions: <Widget>[
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.push(
//                           context, MaterialPageRoute(
//                             builder: (context) => const login(),
//                           ),
//                         );
//                       },
//                       child: const Padding(
//                         padding: EdgeInsets.only(right:25.0),
//                         child: Text("Skip",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
//                       ),
//                     )
//                   ],
//                 ),
//                 Image.asset('assets/images/delivery.jpg',width: 390,height: 400,),

//                 const Center(
//                   child: Text("Quick and fastest delivery",
//                   softWrap: true,
//                   style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold),),
//                 ),
//                 SizedBox(height: 20,),
//                 DotsIndicator(
//                   dotsCount: 3,
//                   position: 2,
//                   decorator: DotsDecorator(
//                     color: Colors.grey,
//                     activeColor: Colors.amber[900],
//                   ),
//                 ),
//                 SizedBox(height: 50,),

//                 ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(25),
//                     ),
//                     backgroundColor: Colors.amber[900]
//                   ),
//                   onPressed: () {
//                     Navigator.push(
//                       context,MaterialPageRoute(
//                         builder: (context) => login(),
//                       ),
//                     );
//                   },
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(vertical:25.0),
//                     child: Image.asset('assets/images/right-arrow.png',width: 10,height: 10,color: Colors.white,),
//                   ),
//                 ),
//             ],
//           )
//         ],
//       ),
//       // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//       // floatingActionButton: Padding(
//       //   padding: const EdgeInsets.only(bottom:20.0),
//       //   child: FloatingActionButton(
//       //     backgroundColor: Colors.amber[900],
//       //     elevation: 0,
//       //     child: Image.asset('assets/images/right-arrow.png',
//       //     width: 15,
//       //     height: 15,
//       //     color: Colors.white,),
//       //     onPressed: () {
//       //     Navigator.push(
//       //       context,MaterialPageRoute(
//       //         builder: (context) => login(),
//       //       ),
//       //     );
//       //   },),
//       // ),
//     );
//   }
// }

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
            top: 50,
            left: 320,
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
                  'Skip',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 200,
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
          Positioned(
            bottom: 80,
            left: 0,
            right: 0,
            child: Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  backgroundColor: Colors.amber[900],
                ),
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
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 25.0),
                  child: Image.asset(
                    'assets/images/right-arrow.png',
                    width: 10,
                    height: 10,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
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
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}
