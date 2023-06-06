import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:uz_pay/screens/auth/auth_view_model.dart';
import 'package:uz_pay/screens/auth/registration/registration.dart';
import 'package:uz_pay/utils/locator.dart';
import 'package:uz_pay/utils/prefs.dart';
import 'package:uz_pay/widgets/custom_button.dart';
import 'package:uz_pay/widgets/custom_input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool progress = false;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AuthModel>(
      create: (context) => AuthModel(),
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            centerTitle: true,
            title: TextButton(
              onPressed: () {
                final prefs = getIt.get<PrefUtils>();
                prefs.setLanguage(prefs.getLanguage() == "uz" ? "en" : "uz");
                Get.updateLocale(Locale(prefs.getLanguage()));
              },
              child: Text(
                getIt.get<PrefUtils>().getLanguage() == "uz" ? "EN" : "UZ",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/images/logo-horizontal.png",
                              width: 200,
                              height: 76,
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            Text(
                              "sign".tr,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 32,
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            CustomInput(
                              hint: "+998 ",
                              text: "phone".tr,
                              miLenght: 0,
                              inputType: TextInputType.phone,
                              controller: phoneController,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            CustomInput(
                              hint: "****",
                              text: "Password",
                              miLenght: 0,
                              controller: passwordController,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20.0, top: 10),
                              child: Row(
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                Registration(),
                                          ));
                                    },
                                    child: const Text(
                                      "Registration",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Consumer<AuthModel>(
                  builder: (context, value, child) {
                    return CustomButton(
                      progress: value.progress,
                      text: "sign".tr,
                      onclick: () {
                        value.login(
                            phoneController.text, passwordController.text);
                      },
                    );
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
