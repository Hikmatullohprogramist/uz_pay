import 'package:flutter/material.dart';
import 'package:uz_pay/utils/customview.dart';

// ignore: must_be_immutable
class ServiceItem extends StatelessWidget {
  String path;
  String name;
  ServiceItem({super.key, required this.name, required this.path});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 8,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(width: 15,),

              buildImage(path, false, 100,100),
              const SizedBox(width: 20,),
              Text(name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),)
            ],
          ),
        ),
      ),
    );
  }
}
