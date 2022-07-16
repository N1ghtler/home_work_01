import 'dart:ui';

import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.amber,
      appBar: _buidAppBar(),
      body: _buildBody(),
    ));
  }

  AppBar _buidAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      bottomOpacity: 0.0,
      elevation: 0.0,
      title: const Text(
        "Profile",
        style: TextStyle(fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget _buildBody() {
    Widget _tilteAndData(String title, String data) {
      return Padding(
        padding: const EdgeInsets.all(5),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.orange,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(data),
            ],
          ),
        ),
      );
    }

    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          child: Container(
            margin: const EdgeInsets.only(top: 50),
            color: Colors.white,
          ),
        ),
        Positioned(
          top: 0,
          child: Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(100),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(200),
              child: Image.asset(
                "assets/image/9.jpeg",
                width: 100,
                height: 100,
              ),
            ),
          ),
        ),
        Positioned(
          top: 120,
          child: Container(
            padding: const EdgeInsets.all(5),
            child: Column(
              children: [
                const Text(
                  "Edit Profile",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.orange,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        _tilteAndData("Username", "usernumber1231"),
                        _tilteAndData(
                            "Email Address", "usernumber1231@gmail.com"),
                      ],
                    ),
                    _tilteAndData("About Me", "Tell people about yourself"),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
