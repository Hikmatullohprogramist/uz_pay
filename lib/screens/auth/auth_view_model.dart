import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:uz_pay/data/api_service.dart';
import 'package:uz_pay/screens/main/main_screen.dart';
import 'package:uz_pay/utils/locator.dart';
import 'package:uz_pay/utils/prefs.dart';

class AuthModel extends ChangeNotifier {
  ApiService apiService = getIt.get<ApiService>();
  var progress = false;


  void login(String phone, String password) async {
    progress = true;
    notifyListeners();
    var data = await apiService.login(phone, password);
    progress = false;
    notifyListeners();
    if (data != null) {
      getIt.get<PrefUtils>().setToken(data.token);
      Get.offAll(const MainScreen());
    }
  }


  void registration(String fullname, String phone, String password) async {
    progress = true;
    notifyListeners();
    var data = await apiService.registration(fullname, phone, password);
    progress = false;
    notifyListeners();
    if (data != null) {
      getIt.get<PrefUtils>().setToken(data.token);
      Get.offAll(const MainScreen());
    }
  }
}
