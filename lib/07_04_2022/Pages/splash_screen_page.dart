import 'package:flutter/material.dart';
import 'package:home_work_01/07_04_2022/Pages/random_users_page.dart';
import 'package:provider/provider.dart';

import '../Logic/random_user_logic.dart';

class SplashScreenPage extends StatefulWidget {
  SplashScreenPage({Key? key}) : super(key: key);

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Icon(
          Icons.supervised_user_circle,
          size: 100,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), () async {
      await context.read<RandomUserLogic>().readbypage();
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => RandomUsersPage(),
          ),
        );
      }
    });
  }
}
