import 'package:flutter/material.dart';
import '27_06_2022/page/json_api.dart';
// import 'package:home_work_01/20_06_2022/state_mod/counter_logic.dart';
// import 'package:provider/provider.dart';
// import 'package:home_work_01/20_06_2022/none_state_mod/none_state_mod.dart';
// import '06_21_2022/page/muti_view_page.dart';
// import '20_06_2022/state_mod/state_page.dart';
// import 'Class/Pages/class_tiktok_page.dart';
// import 'package:home_work_01/Class/Pages/class_page_view.dart';
// import 'package:home_work_01/fix_list/fixlist.dart';
// import 'package:home_work_01/login/login.dart';
// import 'package:home_work_01/old/hw1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // @override
  // Widget build(BuildContext context) {
  //   return MultiProvider(
  //     providers: [ChangeNotifierProvider(create: (context) => CounterLogic())],
  //     child: MaterialApp(
  //       debugShowCheckedModeBanner: false,
  //       home: StatePage(),
  //     ),
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: JsonApiPage(),
    );
  }
}
