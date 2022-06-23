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
      appBar: _buidAppBar(),
      body: _buildBody(),
    ));
  }

  AppBar _buidAppBar() {
    return AppBar();
  }

  Widget _buildBody() {
    return Container();
  }
}
