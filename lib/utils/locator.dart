import 'dart:ui';

import 'package:get_it/get_it.dart';
import 'package:uz_pay/data/api_service.dart';
import 'package:uz_pay/utils/prefs.dart';

final getIt = GetIt.instance;

Future<void> registerSingelton() async {
  final prefUtils  = PrefUtils();
  await prefUtils.initInstane();

  getIt.registerSingleton(prefUtils);
  await provideApiService();
}

Future<void> provideApiService()async{
  try{
    await getIt.unregister<ApiService>();
  }
  catch(e){

  }
  final api = ApiService();
  await api.addHeadrs();
  getIt.registerSingleton(api);
}