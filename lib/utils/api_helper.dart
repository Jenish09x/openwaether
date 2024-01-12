import 'dart:convert';

import 'package:http/http.dart'as http;

import '../screen/home/model/home_model.dart';
class APIHelper {
  Future<HomeModel?> apiToModel(String city) async {
    String apiLink="https://api.openweathermap.org/data/2.5/weather?q=$city&appid=ae7fb45f57d3c4d4a67de3204d0ea804";
    var response = await http.get(Uri.parse(apiLink));
    if(response.statusCode==200)
      {
        var json=jsonDecode(response.body);
        HomeModel? homeModel = HomeModel.mapToModel(json);
        return homeModel;
      }
    return null;
  }
}
