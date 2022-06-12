import 'package:flutter/material.dart';

class ListFixEx1 extends StatelessWidget {
  const ListFixEx1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Icon(
            Icons.camera,
            size: 200,
          ),
          Icon(
            Icons.account_box,
            size: 230.0,
          ),
          Icon(
            Icons.place,
            size: 200.0,
          ),
          Icon(
            Icons.info,
            size: 250.0,
          ),
        ],
      ),
    );
  }
}
