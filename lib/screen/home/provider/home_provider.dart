import 'package:flutter/cupertino.dart';

import '../../../utils/api_helper.dart';
import '../model/home_model.dart';

class HomeProvider with ChangeNotifier {
  HomeModel? homeModel;
  bool isOnline = false;
  String city='surat';

  Future<void> getData() async {
    APIHelper apiHelper = APIHelper();
    HomeModel? h1 = await apiHelper.apiToModel(city);
    homeModel = h1;
    notifyListeners();
  }

  void changeStatus(bool status){
    isOnline = status;
    notifyListeners();
  }

  void searchData(String data)
  {
    city=data;
    notifyListeners();
  }
}
