import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_app/welcome_screen/skip.dart';
import 'package:food_app/login/verify.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController phcontroller = TextEditingController();
  bool isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    getLoginData();
  }

  SharedPreferences? preferences;

  void getLoginData() async {
    preferences = await SharedPreferences.getInstance();
    preferences!.setString('phoneNumber', phcontroller.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Skip(),
                ),
              );
            },
            child: const Icon(Icons.arrow_back),
          ),
        ),
      ),
      body: Column(
        children: [
          const Center(
            child: Padding(
              padding: EdgeInsets.only(top: 80.0),
              child: Text(
                'Enter your mobile number',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 20),
            child: Text(
              'We will send you a verification code',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: TextFormField(
              inputFormatters: [
                LengthLimitingTextInputFormatter(10),
              ],
              controller: phcontroller,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                prefix: const Text('+91|'),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  backgroundColor: Colors.amber[900]),
              onPressed: () {
                if (phcontroller.text.length == 10) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Verify(
                        phoneNumber: phcontroller.text,
                      ),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Invalid Number. Please try again.'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                }
              },
              child: const Text(
                'Continue',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
