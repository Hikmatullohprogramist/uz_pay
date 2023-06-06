import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uz_pay/screens/auth/auth_view_model.dart';
import 'package:uz_pay/screens/auth/login/login.dart';
import 'package:uz_pay/widgets/custom_button.dart';
import 'package:uz_pay/widgets/custom_input.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  TextEditingController fullnameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AuthModel>(
      create: (context) => AuthModel(),
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              "Sing Up",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w500,
              ),
            ),
            elevation: 0,
            backgroundColor: Colors.transparent,
            iconTheme: IconThemeData(color: Colors.black),
          ),
          body: SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Sing Up",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 32,
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w600),
                      ),
                      CustomInput(
                        hint: "",
                        text: "Full name",
                        miLenght: 0,
                        controller: fullnameController,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomInput(
                        hint: "+998",
                        text: "Phone",
                        miLenght: 0,
                        controller: phoneController,
                        inputType: TextInputType.phone,
                      ),
                      const SizedBox(height: 15),
                      CustomInput(
                        hint: "****",
                        text: "Password",
                        miLenght: 8,
                      ),
                      const SizedBox(height: 15),
                      CustomInput(
                        hint: "****",
                        text: "Repassword",
                        miLenght: 8,
                        controller: passwordController,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, top: 10),
                        child: Row(
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => LoginScreen(),
                                    ));
                              },
                              child: const Text(
                                "Sign in",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 15),
                      Consumer<AuthModel>(
                        builder: (context, value, child) {
                          return CustomButton(
                            text: "Registration",
                            onclick: () {
                              value.registration(
                                  fullnameController.text,
                                  phoneController.text,
                                  passwordController.text);
                            },
                            progress: false,
                          );
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
