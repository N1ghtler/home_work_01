import 'package:flutter/material.dart';
import 'Class/Pages/class_tiktok_page.dart';
import 'package:home_work_01/Class/Pages/class_page_view.dart';
import 'package:home_work_01/fix_list/fixlist.dart';
import 'package:home_work_01/login/login.dart';
import 'package:home_work_01/old/hw1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ClassTikTok(),
    );
  }
}
