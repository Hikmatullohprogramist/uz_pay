import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:uz_pay/screens/auth/login/login.dart';
import 'package:uz_pay/screens/main/main_screen.dart';
import 'package:uz_pay/utils/locator.dart';
import 'package:uz_pay/utils/prefs.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 2), () {
     Get.offAll(getIt.get<PrefUtils>().getToken().isNotEmpty ?  const MainScreen():const LoginScreen());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/logo-horizontal.png",
              height: 76,
              width: 200,
            ),
            Lottie.asset("assets/json/splash-animation.json"),
          ],
        ),
      ),
    );
  }
}
