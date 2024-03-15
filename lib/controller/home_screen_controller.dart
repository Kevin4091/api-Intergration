import 'dart:convert';

import 'package:api/model/home_screen_model/sample_api_res_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreenController with ChangeNotifier {
  SampleApiResModel? resModel;
  Future<void> fetchData() async {
    final url = Uri.parse("https://api.publicapis.org/entries");
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var decodeData = jsonDecode(response.body);
      print(decodeData["entries"][1]["Description"]);

      resModel = SampleApiResModel.fromJson(decodeData);
    } else {
      print("api call failed");
    }
    notifyListeners();
  }
}
