import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:food_app/bottom_navigation%20_bar/main_screen.dart';
import 'package:food_app/login/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Verify extends StatefulWidget {
  final String phoneNumber;
  const Verify({
    super.key,
    required this.phoneNumber,
  });

  @override
  State<Verify> createState() => _VerifyState();
}

class _VerifyState extends State<Verify> {
  TextEditingController otpcontroller = TextEditingController();
  String storedOTP = "";

  @override
  void initState() {
    super.initState();
    getSharedPreferences();
  }

  SharedPreferences? preferences;

  void getSharedPreferences() async {
    preferences = await SharedPreferences.getInstance();
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
                  builder: (context) => const Login(),
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
                'Verification codes OTP',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: Text(
              'Verification code has been sent to your number',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            // child: TextFormField(
            //   inputFormatters: [
            //     LengthLimitingTextInputFormatter(4),
            //   ],
            //   controller: otpcontroller,
            //   keyboardType: TextInputType.phone,
            //   decoration: InputDecoration(
            //     border: OutlineInputBorder(
            //       borderRadius: BorderRadius.circular(10),
            //     ),
            //   ),
            // ),
            child: OtpTextField(
              numberOfFields: 4,
              showFieldAsBox: true,
              fieldWidth: 50,
              onSubmit: (value) {
                otpcontroller.text = value;
                log(otpcontroller.text);
              },
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
              onPressed: () async {
                if (otpcontroller.text.length == 4) {
                  preferences!.setBool('isLoggedIn', true);
                  preferences!.setString("phone_number", widget.phoneNumber);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Home(),
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Logged In Successfully'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                } else {
                  // ignore: use_build_context_synchronously
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Invalid OTP. Please try again.'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                }
              },
              child: const Text(
                'Verify',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
