import 'dart:convert';

ProductModel getProductModel(String data) {
  Map<String, dynamic> map = json.decode(data);
  return ProductModel.fromJson(map);
}

class ProductModel {
  ProductModel({
    required this.products,
  });

  late final List<Product> products;

  ProductModel.fromJson(Map<String, dynamic> json) {
    products =
        List.from(json['products']).map((e) => Product.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['products'] = products.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Product {
  Product({
    required this.pid,
    this.name = "no name",
    this.price = "0",
    this.qty = "0",
    this.image = "no image",
    this.outOfStock = "0",
  });

  late final String pid;
  late final String name;
  late final String price;
  late final String qty;
  late final String image;
  late final String outOfStock;

  Product.fromJson(Map<String, dynamic> json) {
    pid = json['pid'];
    name = json['name'];
    price = json['price'];
    qty = json['qty'];
    image = json['image'];
    outOfStock = json['out_of_stock'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['pid'] = pid;
    _data['name'] = name;
    _data['price'] = price;
    _data['qty'] = qty;
    _data['image'] = image;
    _data['out_of_stock'] = outOfStock;
    return _data;
  }
}
