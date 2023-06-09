// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uz_pay/data/api_service.dart';
import 'package:uz_pay/data/models/add_account.dart';
import 'package:uz_pay/data/models/category_with_id_model.dart';
import 'package:uz_pay/screens/service/service.dart';
import 'package:uz_pay/utils/locator.dart';


class ServiceViewModel extends ChangeNotifier {
  ApiService apiService = getIt.get<ApiService>();
  var progress = false;
  List<CategoryModelWithID> categoryList = [];
  List<AddAccount> addAccountList = [];

  Future<void> getcategoryListWithIndex(String id) async {
    progress = true;
    notifyListeners();
    categoryList = await apiService.getCategoryListWithIndex(id);
    progress = false;
    notifyListeners();
  }

  Future<void> addAccount(String pay_id) async {
    progress = true;
    notifyListeners();
    addAccountList = await apiService.addAccount(pay_id);
    progress = false;
    notifyListeners();
    Get.to(PaymentList(
      id: pay_id.toString(),
    ));
  }
}
