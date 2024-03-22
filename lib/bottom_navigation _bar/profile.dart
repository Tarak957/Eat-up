import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key, File? imageFile});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String storedPhoneNumber = "";

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  SharedPreferences? preferences;

  void getUserData() async {
    preferences = await SharedPreferences.getInstance();
    storedPhoneNumber = preferences!.getString('phone_number') ?? 'N/A';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              storedPhoneNumber,
              style: TextStyle(fontSize: 25),
            ),
          ),
        ),
      ],
    );
  }
}
