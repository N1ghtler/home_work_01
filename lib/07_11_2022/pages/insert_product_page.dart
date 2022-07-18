import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../logics/product_logic.dart';
import '../models/product_model.dart';

class InsertProductPage extends StatefulWidget {
  const InsertProductPage({Key? key}) : super(key: key);

  @override
  State<InsertProductPage> createState() => _InsertProductPageState();
}

class _InsertProductPageState extends State<InsertProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.orange,
      title: const Text("Insert Product Page"),
      actions: [
        IconButton(
          onPressed: () async {
            if (_formKey.currentState!.validate()) {
              Product item = Product(
                pid: "0",
                name: _nameCtrl.text.trim(),
                price: _priceCtrl.text.trim(),
                qty: _qtyCtrl.text.trim(),
                image: _imageCtrl.text.trim(),
                outOfStock: _checked ? "1" : "0",
              );

              bool success = await ProductLogic.insert(item);
              if (success) {
                await context.read<ProductLogic>().read();
                //showSnackBar(context, "Item inserted");
                _nameCtrl.clear();
                _priceCtrl.clear();
                _qtyCtrl.clear();
                _imageCtrl.clear();
                setState(() {
                  _checked = false;
                  _imageUrl = null;
                });
              } else {
                //showSnackBar(context, "Something went wrong while inserting");
              }
            } else {
              //showSnackBar(context, "All fields are required");
            }
          },
          icon: const Icon(Icons.save_alt),
        ),
      ],
    );
  }

  final _formKey = GlobalKey<FormState>();

  Widget _buildBody() {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(20),
      child: Form(
        key: _formKey,
        child: ListView(
          children: [
            _buildOutOfStockCheckbox(),
            _buildNameTextField(),
            _buildPriceTextField(),
            _buildQtyTextField(),
            _buildImageTextField(),
            _buildImageBox(),
          ],
        ),
      ),
    );
  }

  final _nameCtrl = TextEditingController();
  final _priceCtrl = TextEditingController();
  final _qtyCtrl = TextEditingController();
  final _imageCtrl = TextEditingController();

  Widget _buildNameTextField() {
    return TextFormField(
      decoration: const InputDecoration(
        hintText: "Enter name",
      ),
      controller: _nameCtrl,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a name';
        }
        return null;
      },
    );
  }

  Widget _buildPriceTextField() {
    return TextFormField(
      decoration: const InputDecoration(
        hintText: "Enter price",
      ),
      controller: _priceCtrl,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a price';
        }
        return null;
      },
    );
  }

  Widget _buildQtyTextField() {
    return TextFormField(
      decoration: const InputDecoration(
        hintText: "Enter qty",
      ),
      controller: _qtyCtrl,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a qty';
        }
        return null;
      },
    );
  }

  Widget _buildImageTextField() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Enter image url",
        suffixIcon: IconButton(
          icon: const Icon(Icons.preview),
          onPressed: () {
            setState(() {
              _imageUrl = _imageCtrl.text;
            });
          },
        ),
      ),
      maxLines: 4,
      controller: _imageCtrl,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a image url';
        }
        return null;
      },
    );
  }

  String? _imageUrl;

  Widget _buildImageBox() {
    if (_imageUrl == null) {
      return const SizedBox();
    } else {
      return Container(
        height: 300,
        margin: const EdgeInsets.all(20),
        child: Image.network(_imageCtrl.text.trim()),
      );
    }
  }

  bool _checked = false;

  Widget _buildOutOfStockCheckbox() {
    return CheckboxListTile(
      title: const Text("Out of Stock"),
      value: _checked,
      onChanged: (value) {
        setState(() {
          _checked = value ?? false;
        });
      },
    );
  }
}
