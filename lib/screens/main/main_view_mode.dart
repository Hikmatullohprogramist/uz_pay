import 'package:flutter/material.dart';
import 'package:uz_pay/data/api_service.dart';
import 'package:uz_pay/data/models/card_model.dart';
import 'package:uz_pay/data/models/category_model.dart';
import 'package:uz_pay/data/models/payment_history.dart';
import 'package:uz_pay/utils/locator.dart';

class MainViewModel extends ChangeNotifier {
  ApiService apiService = getIt.get<ApiService>();
  var progress = false;
  List<CardModel> cardList = [];
  List<CategoryModel> categoryList = [];
  List<PaymentHistoroyModel> paymentHistory = [];

  Future<void> getcardList() async {
    progress = true;
    notifyListeners();
    cardList = await apiService.getMyCardList();
    progress = false;
    notifyListeners();
  }

  Future<void> getcategoryList() async {
    progress = true;
    notifyListeners();
    categoryList = await apiService.getCategoryList();
    progress = false;
    notifyListeners();
  }

  Future<void> getPaymentHistory() async {
    progress = true;
    notifyListeners();
    paymentHistory = await apiService.getPaymentHistory();
    progress = false;
    notifyListeners();
  }
}
