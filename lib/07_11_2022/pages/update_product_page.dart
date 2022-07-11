import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../logics/product_logic.dart';
import '../models/product_model.dart';

class UpdateProductPage extends StatefulWidget {
  // const UpdateProductPage({Key? key}) : super(key: key);

  final Product item;
  UpdateProductPage(this.item);

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.indigo,
      title: Text("Update Product Page"),
      actions: [
        IconButton(
          onPressed: () async{
            if (_formKey.currentState!.validate()) {
              Product item = Product(
                pid: widget.item.pid,
                name: _nameCtrl.text.trim(),
                price: _priceCtrl.text.trim(),
                qty: _qtyCtrl.text.trim(),
                image: _imageCtrl.text.trim(),
                outOfStock: _checked ? "1" : "0",
              );

              bool success = await ProductLogic.update(item);
              if(success){
                await context.read<ProductLogic>().read();
                showSnackBar(context, "Item updated");
                Navigator.of(context).pop(); //go back
              }
              else{
                showSnackBar(context, "Something went wrong while inserting");
              }

            } else {
              showSnackBar(context, "All fields are required");
            }
          },
          icon: Icon(Icons.save_alt),
        ),
      ],
    );
  }

  final _formKey = GlobalKey<FormState>();

  Widget _buildBody() {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(20),
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

  late var _nameCtrl = TextEditingController(text: widget.item.name);
  late var _priceCtrl = TextEditingController(text: widget.item.price);
  late var _qtyCtrl = TextEditingController(text: widget.item.qty);
  late var _imageCtrl = TextEditingController(text: widget.item.image);

  Widget _buildNameTextField() {
    return TextFormField(
      decoration: InputDecoration(
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
      decoration: InputDecoration(
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
      decoration: InputDecoration(
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
          icon: Icon(Icons.preview),
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

  late String? _imageUrl = widget.item.image;

  Widget _buildImageBox(){
    if(_imageUrl == null){
      return SizedBox();
    }
    else{
      return Container(
        height: 300,
        margin: EdgeInsets.all(20),
        child: Image.network(_imageCtrl.text.trim()),
      );
    }
  }

  late bool _checked = widget.item.outOfStock == "1" ? true : false;

  Widget _buildOutOfStockCheckbox() {
    return CheckboxListTile(
      title: Text("Out of Stock"),
      value: _checked,
      onChanged: (value) {
        setState(() {
          _checked = value ?? false;
        });
      },
    );
  }
}
