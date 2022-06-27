import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../model/post_model.dart';

class PostData {
  static Future<List<PostModel>> getData() async {
    String url = "https://jsonplaceholder.typicode.com/photos?albumId=2";
    try {
      http.Response response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return compute(getPostModelList, response.body);
      } else {
        throw Exception("Error while reading, code: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error while reading, ${e.toString()}");
    }
  }
}
