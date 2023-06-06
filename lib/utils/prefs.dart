 // ignore_for_file: constant_identifier_names

 import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uz_pay/utils/constantas.dart';

class PrefUtils {
  late SharedPreferences _singleton;

  static const PREF_LANG = "lang";
  static const PREF_TOKEN = "token";

  SharedPreferences getInstanse() {
    return _singleton;
  }

  Future<bool> initInstane() async {
    _singleton = await SharedPreferences.getInstance();
    return true;
  }

  String getLanguage() {
    var local = Get.deviceLocale;
    return _singleton.getString(PREF_LANG) ??
        (languages
                .where((element) => element.code == local?.languageCode)
                .isNotEmpty
            ? local!.languageCode
            : "en");
  }

  Future<bool>setLanguage(String value)async{
    return _singleton.setString(PREF_LANG, value);


  }


  String getToken() {

    return _singleton.getString(PREF_TOKEN) ?? "";
  }

  Future<bool>setToken(String value)async{
    return _singleton.setString(PREF_TOKEN, value);


  }

  Future<void> clearAll()async{
    final pref = await SharedPreferences.getInstance();
    await pref.clear();
    return;
  }
}
