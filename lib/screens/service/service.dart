import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:uz_pay/screens/service/service_view_model.dart';
import 'package:uz_pay/utils/customview.dart';
import 'package:uz_pay/widgets/service_item.dart';

// ignore: must_be_immutable
class PaymentList extends StatefulWidget {
  String id;
  PaymentList({super.key, required this.id});
  @override
  State<PaymentList> createState() => _PaymentListState();
}

class _PaymentListState extends State<PaymentList> {
  late ServiceViewModel viewModel;
  @override
  void initState() {
    viewModel = context.read<ServiceViewModel>();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      viewModel.getcategoryListWithIndex(widget.id);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "PAYMENT LIST",
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
      ),
      body: Consumer<ServiceViewModel>(
        builder: (context, value, child) {
          return value.categoryList.isEmpty
              ? Center(
                  child: Lottie.asset('assets/json/no-item-in-box.json'),
                )
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: value.categoryList.length,
                  itemBuilder: (context, index) {
                    return ServiceItem(
                        name: value.categoryList[index].name,
                        path: value.categoryList[index].image);
                  },
                );
        },
      ),
    );
  }
}
