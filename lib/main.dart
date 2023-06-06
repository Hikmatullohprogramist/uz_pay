import 'package:dio_request_inspector/dio_request_inspector.dart';
import 'package:dio_request_inspector/presentation/main/page/main_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:uz_pay/screens/card/add/add_card_view_model.dart';
import 'package:uz_pay/screens/main/main_view_mode.dart';
import 'package:uz_pay/screens/service/service_view_model.dart';
import 'package:uz_pay/screens/splash/splash.dart';
import 'package:uz_pay/utils/lang.dart';
import 'package:uz_pay/utils/locator.dart';
import 'package:uz_pay/utils/prefs.dart';

DioRequestInspector dioRequestInspector =
    DioRequestInspector(isDebugMode: kDebugMode);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  registerSingelton();
  await PrefUtils().initInstane();

  runApp(DioRequestInspectorMain(
      inspector: dioRequestInspector,
      child:   const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MainViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => AddCardViewModel(),
        ), ChangeNotifierProvider(
          create: (context) => ServiceViewModel(),
        ),
      ],
      child: GetMaterialApp(
        navigatorKey: dioRequestInspector.navigatorKey,
        translations: Languages(),
        locale: Locale(getIt.get<PrefUtils>().getLanguage()),
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(),
        home: const SplashScreen(),
      ),
    );
  }
}
