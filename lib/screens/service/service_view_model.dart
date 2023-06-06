import 'package:flutter/material.dart';
import 'package:uz_pay/data/api_service.dart';
import 'package:uz_pay/data/models/category_with_id_model.dart';
import 'package:uz_pay/utils/locator.dart';

import '../../data/models/category_model.dart';

class ServiceViewModel extends ChangeNotifier{
  ApiService apiService = getIt.get<ApiService>();
  var progress = false;
  List<CategoryModelWithID> categoryList = [];

  Future<void> getcategoryListWithIndex(String id) async {
    progress = true;
    notifyListeners();
    categoryList = await apiService.getCategoryListWithIndex(id);
    progress = false;
    notifyListeners();
  }


}