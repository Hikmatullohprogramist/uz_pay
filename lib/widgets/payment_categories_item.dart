// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uz_pay/screens/service/service_view_model.dart';
import 'package:uz_pay/utils/customview.dart';

class PaymentCategories extends StatelessWidget {
  String url;
  String text;
  String id;
  PaymentCategories(
    this.id, {
    required this.url,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ServiceViewModel>(builder: (context, value, child) {
      return InkWell(
        onTap: () => value.addAccount(id),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35),
            boxShadow: const [
              BoxShadow(
                color: Color(0x3f000000),
                blurRadius: 4,
                offset: Offset(0, 4),
              ),
            ],
            color: Colors.white,
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  buildImage(url, false, 60, 60, BoxFit.cover),
                  Text(
                    text,
                    style: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontSize: 18,
                        fontWeight: FontWeight.w400),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
