import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

import '../constants/local_status_constant.dart';
import '../logics/product_logic.dart';
import '../models/product_model.dart';
import 'insert_product_page.dart';
import 'update_product_page.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    // _pageController.addListener(() async {
    //   if (_pageController.position.pixels ==
    //       _pageController.position.maxScrollExtent) {
    //     print("Reached the bottom");
    //     await context.read<ProductLogic>().read();
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.brown,
      title: const Text("Product Page"),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const InsertProductPage(),
              ),
            );
          },
          icon: const Icon(Icons.add),
        ),
      ],
    );
  }

  Widget _buildBody() {
    return Container(
      alignment: Alignment.center,
      child: _buildLoading(),
    );
  }

  Widget _buildLoading() {
    LocalStatus status = context.watch<ProductLogic>().status;
    switch (status) {
      case LocalStatus.none:
      case LocalStatus.loading:
        return const CircularProgressIndicator();
      case LocalStatus.error:
        return _buildError();
      case LocalStatus.done:
        return _buildDisplay();
    }
  }

  Widget _buildError() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.error, size: 30),
        const Text("No internet connection", style: TextStyle(fontSize: 20)),
        const Text("or something went wrong!", style: TextStyle(fontSize: 20)),
        ElevatedButton.icon(
          onPressed: () async {
            context.read<ProductLogic>().setLoading();
            await context.read<ProductLogic>().read();
          },
          icon: const Icon(Icons.refresh),
          label: const Text("RETRY"),
        ),
      ],
    );
  }

  Widget _buildDisplay() {
    List<Product> productList =
        context.watch<ProductLogic>().productModel.products;

    return RefreshIndicator(
      onRefresh: () async {
        // context.read<RandomUserLogic>().setLoading();
        await context.read<ProductLogic>().read();
      },
      child: ListView.builder(
        controller: _pageController,
        physics: const BouncingScrollPhysics(),
        itemCount: productList.length,
        itemBuilder: (context, index) {
          return _buildItem(productList[index]);
        },
      ),
    );
  }

  Widget _buildItem(Product item) {
    return Slidable(
      startActionPane: ActionPane(
        extentRatio: 1 / 4,
        motion: const DrawerMotion(),
        children: [
          SlidableAction(
            onPressed: (ctx) {},
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            icon: Icons.archive,
            label: 'Archive',
          ),
        ],
      ),
      endActionPane: ActionPane(
        motion: const DrawerMotion(),
        children: [
          SlidableAction(
            onPressed: (ctx) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => UpdateProductPage(item),
                ),
              );
            },
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            icon: Icons.edit,
            label: 'Edit',
          ),
          SlidableAction(
            onPressed: (ctx) async {
              bool success = await ProductLogic.delete(item);
              if (success) {
                await context.read<ProductLogic>().read();
              } else {}
            },
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),
      child: Card(
        child: ListTile(
          leading: Image.network(item.image),
          title: Text(item.name),
          subtitle: Text(item.price),
          trailing: Text(item.qty),
        ),
      ),
    );
  }
}
