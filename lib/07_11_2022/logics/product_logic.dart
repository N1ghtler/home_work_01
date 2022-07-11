import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../constants/base_url.dart';
import '../constants/local_status_constant.dart';
import '../models/product_model.dart';

class ProductLogic extends ChangeNotifier {
  ProductModel _productModel = ProductModel(products: []);
  ProductModel get productModel => _productModel;

  LocalStatus _status = LocalStatus.none;

  LocalStatus get status => _status;

  void setLoading() {
    _status = LocalStatus.loading;
    notifyListeners();
  }

  Future read() async {
    final url = readUrl;
    try {
      http.Response response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        _productModel = await compute(getProductModel, response.body);
        _status = LocalStatus.done;
      } else {
        print("Error while reading, code: ${response.statusCode}");
        _status = LocalStatus.error;
      }
    } catch (e) {
      print("Error while reading, ${e.toString()}");
      _status = LocalStatus.error;
    }
    notifyListeners();
  }

  static Future<bool> delete(Product item) async {
    final url = deleteUrl;
    try {
      http.Response response = await http.post(Uri.parse(url), body: item.toJson());
      if (response.statusCode == 200) {
        print("response.body: ${response.body}");
        if(response.body.trim() == "delete_success"){
          return true;
        }else{
          return false;
        }

      } else {
        print("Error while deleting, code: ${response.statusCode}");
        return false;
      }
    } catch (e) {
      print("Error while deleting, ${e.toString()}");
      return false;
    }
  }

  static Future<bool> insert(Product item) async {
    final url = insertUrl;
    try {
      http.Response response = await http.post(Uri.parse(url), body: item.toJson());
      if (response.statusCode == 200) {
        print("response.body: ${response.body}");
        if(response.body.trim() == "insert_success"){
          return true;
        }else{
          return false;
        }

      } else {
        print("Error while inserting, code: ${response.statusCode}");
        return false;
      }
    } catch (e) {
      print("Error while inserting, ${e.toString()}");
      return false;
    }
  }

  static Future<bool> update(Product item) async {
    final url = updateUrl;
    try {
      http.Response response = await http.post(Uri.parse(url), body: item.toJson());
      if (response.statusCode == 200) {
        print("response.body: ${response.body}");
        if(response.body.trim() == "update_success"){
          return true;
        }else{
          return false;
        }

      } else {
        print("Error while updating, code: ${response.statusCode}");
        return false;
      }
    } catch (e) {
      print("Error while updating, ${e.toString()}");
      return false;
    }
  }
}
