// ignore_for_file: library_prefixes, unnecessary_string_interpolations, unnecessary_brace_in_string_interps, non_constant_identifier_names

import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as getX;
import 'package:uz_pay/data/models/add_account.dart';
import 'package:uz_pay/data/models/card_model.dart';
import 'package:uz_pay/data/models/category_model.dart';
import 'package:uz_pay/data/models/category_with_id_model.dart';
import 'package:uz_pay/data/models/login_response.dart';
import 'package:uz_pay/data/models/payment_history.dart';
import 'package:uz_pay/utils/locator.dart';
import 'package:uz_pay/utils/prefs.dart';

import '../main.dart';
import '../utils/constantas.dart';
import 'models/base_response.dart';

class ApiService {
  late final Dio dio;

  ApiService() {
    dio = Dio();
    dio.options.baseUrl = "${BASE_URL}api/";
    dio.interceptors.add(dioRequestInspector.getDioRequestInterceptor());
  }

  Future<void> addHeadrs() async {
    dio.options.headers.addAll({
      'lang': getIt.get<PrefUtils>().getLanguage(),
      'token': "${getIt.get<PrefUtils>().getToken()}",
      'Key': DEVELOPER_KEY,
    });
    return;
  }

  BaseResponse wrapResponse(Response<dynamic> response) {
    if (response.statusCode == 200) {
      try {
        return BaseResponse.fromJson(response.data);
      } catch (e) {
        return BaseResponse(false, "Json Xato! ${e}", 0, 1);
      }
    } else {
      return BaseResponse(false,
          response.statusMessage ?? "ERROR!!! ${response.statusCode}", 0, 1);
    }
  }

  Future<LoginResponse?> login(String phone, String password) async {
    try {
      final response = wrapResponse(await dio.post("login", data: {"phone": phone, "password": password}));

      if (response.success) {
        return LoginResponse.fromJson(response.data);
      } else {
        getX.Get.showSnackbar(getX.GetSnackBar(
          messageText: Text(response.message),
        ));
      }
    } catch (e) {
      getX.Get.showSnackbar(getX.GetSnackBar(
        messageText: Text(e.toString()),
      ));
    }
    return null;
  }

  Future<LoginResponse?> registration(
    String fullname,
    String phone,
    String password,
  ) async {
    try {
      final response = wrapResponse(await dio.post("registration", data: {
        "fullname": fullname,
        "phone": phone,
        "password": password,
      }));

      if (response.success) {
        return LoginResponse.fromJson(response.data);
      } else {
        getX.Get.showSnackbar(getX.GetSnackBar(
          messageText: Text(response.message),
        ));
      }
    } catch (e) {
      getX.Get.showSnackbar(getX.GetSnackBar(
        messageText: Text(e.toString()),
      ));
    }
    return null;
  }

  Future<List<CardModel>> getMyCardList() async {
    try {
      final response = wrapResponse(await dio.get("card/list"));

      if (response.success) {
        return (response.data as List<dynamic>)
            .map((e) => CardModel.fromJson(e))
            .toList();
      } else {
        getX.Get.showSnackbar(getX.GetSnackBar(
          messageText: Text(response.message),
        ));
      }
    } catch (e) {
      getX.Get.showSnackbar(getX.GetSnackBar(
        messageText: Text(e.toString()),
      ));
    }
    return [];
  }

  Future<List<CardModel>> addCard(
      String name, String card_number, String validity_period) async {
    try {
      final response = wrapResponse(await dio.post("add/card", data: {
        "name": name,
        "card_number": card_number,
        "validity_period": validity_period
      }));

      if (response.success) {
        return (response.data as List<dynamic>)
            .map((e) => CardModel.fromJson(e))
            .toList();
      } else {
        getX.Get.showSnackbar(getX.GetSnackBar(
          messageText: Text(response.message),
        ));
      }
    } catch (e) {
      getX.Get.showSnackbar(getX.GetSnackBar(
        messageText: Text(e.toString()),
      ));
    }
    return [];
  }

  Future<List<CategoryModel>> getCategoryList() async {
    try {
      final response = wrapResponse(await dio.get("categories"));

      if (response.success) {
        return (response.data as List<dynamic>)
            .map((e) => CategoryModel.fromJson(e))
            .toList();
      } else {
        getX.Get.showSnackbar(getX.GetSnackBar(
          messageText: Text(response.message),
        ));
      }
    } catch (e) {
      getX.Get.showSnackbar(getX.GetSnackBar(
        messageText: Text(e.toString()),
      ));
    }
    return [];
  }Future<List<CategoryModelWithID>> getCategoryListWithIndex(String id) async {
    try {
      final response = wrapResponse(await dio.get("category/$id/services"));

      if (response.success) {
        return (response.data as List<dynamic>)
            .map((e) => CategoryModelWithID.fromJson(e))
            .toList();
      } else {
        getX.Get.showSnackbar(getX.GetSnackBar(
          messageText: Text(response.message),
        ));
      }
    } catch (e) {
      getX.Get.showSnackbar(getX.GetSnackBar(
        messageText: Text(e.toString()),
      ));
    }
    return [];
  }
  Future<List<PaymentHistoroyModel>> getPaymentHistory() async {
    try {
      final response = wrapResponse(await dio.get("payment/list"));

      if (response.success) {
        return (response.data as List<dynamic>)
            .map((e) => PaymentHistoroyModel.fromJson(e))
            .toList();
      } else {
        getX.Get.showSnackbar(getX.GetSnackBar(
          messageText: Text(response.message),
        ));
      }
    } catch (e) {
      getX.Get.showSnackbar(getX.GetSnackBar(
        messageText: Text(e.toString()),
      ));
    }
    return [];
  }
  Future<List<AddAccount>> addAccount(String pay_id) async {
    try {
      final response = wrapResponse(await dio.post("add/account", data: {"pay_id":pay_id}));

      if (response.success) {
        return (response.data as List<dynamic>)
            .map((e) => AddAccount.fromJson(e))
            .toList();
      } else {
        getX.Get.showSnackbar(getX.GetSnackBar(
          messageText: Text(response.message),
        ));
      }
    } catch (e) {
      getX.Get.showSnackbar(getX.GetSnackBar(
        messageText: Text(e.toString()),
      ));
    }
    return [];
  }

}
