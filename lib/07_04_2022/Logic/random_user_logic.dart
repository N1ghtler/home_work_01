import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../Model/random_user.dart';
import '../constants/status_constant.dart';

const _result = 20;

class RandomUserLogic extends ChangeNotifier {
  RandomUserModel _randomUserModel = RandomUserModel(results: [], info: Info());
  RandomUserModel get randomUserModel => _randomUserModel;

  Status _status = Status.none;
  Status get status => _status;

  void setLoading() {
    _status = Status.loading;
    notifyListeners();
  }

  Future read() async {
    const String url = "https://randomuser.me/api?results=$_result";
    try {
      http.Response response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        _randomUserModel = await compute(getRandomUser, response.body);
        _status = Status.done;
      } else {
        //print("Error while reading, code: ${response.statusCode}");
        _status = Status.error;
      }
    } catch (e) {
      //print("Error while reading, ${e.toString()}");
      _status = Status.error;
    }
    notifyListeners();
  }

  int _page = 0;
  List<Result> _resultList = [];
  List<Result> get resultList => _resultList;

  Future readbypage({bool isRefesh = false}) async {
    _page++;

    final String url = "https://randomuser.me/api?results=$_result&page=$_page";
    try {
      http.Response response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        _randomUserModel = await compute(getRandomUser, response.body);
        if (isRefesh == true) {
          _resultList = _randomUserModel.results;
        } else {
          _resultList += _randomUserModel.results;
        }
        _status = Status.done;
      } else {
        _status = Status.error;
      }
    } catch (e) {
      _status = Status.error;
    }
    notifyListeners();
  }
}
