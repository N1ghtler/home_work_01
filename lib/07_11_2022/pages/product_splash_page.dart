import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../logics/product_logic.dart';
import 'product_page.dart';

class ProductSplashPage extends StatefulWidget {
  const ProductSplashPage({Key? key}) : super(key: key);

  @override
  State<ProductSplashPage> createState() => _ProductSplashPageState();
}

class _ProductSplashPageState extends State<ProductSplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () async{
      await context.read<ProductLogic>().read();
      if(mounted){
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const ProductPage(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Icon(Icons.shopping_cart, size: 100,),
      ),
    );
  }
}
