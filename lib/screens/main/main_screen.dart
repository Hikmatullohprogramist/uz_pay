import 'dart:typed_data';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:provider/provider.dart';
import 'package:uz_pay/screens/card/add/add_card.dart';
import 'package:uz_pay/screens/main/main_view_mode.dart';
import 'package:uz_pay/utils/constantas.dart';
import 'package:uz_pay/widgets/custom_input.dart';
import 'package:uz_pay/widgets/payment_categories_item.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late MainViewModel viewModel;

  @override
  void initState() {
    viewModel = context.read<MainViewModel>();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      viewModel.getcardList();
      viewModel.getcategoryList();
      viewModel.getPaymentHistory();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "UZ PAY",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.person,
              color: Colors.grey,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: LiquidPullToRefresh(
        color: Colors.transparent,
        backgroundColor: Colors.deepPurple,
        height: 120,
        showChildOpacityTransition: true,
        borderWidth: 2,
        onRefresh: () async {
          viewModel.getcardList();
          viewModel.getcategoryList();
          viewModel.getPaymentHistory();
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 16,
                ),
                Consumer<MainViewModel>(
                  builder: (context, value, child) {
                    return CarouselSlider(
                      items: [
                        ...value.cardList
                            .mapIndexed((index, e) => ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: Container(
                                    color: Colors.white,
                                    child: Stack(
                                      children: [
                                        Image.asset(
                                          cardBackgroundList[index %
                                              cardBackgroundList.length],
                                          width: double.infinity,
                                          height: double.infinity,
                                          fit: BoxFit.cover,
                                        ),
                                        Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Padding(
                                            padding: const EdgeInsets.all(16.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.stretch,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text(
                                                  value.cardList[index]
                                                      .card_number,
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                        value.cardList[index]
                                                            .name,
                                                        style: const TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                    Text(
                                                      value.cardList[index]
                                                          .validity_period,
                                                      style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w200,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ))
                            .toList(),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Container(
                            color: Colors.white,
                            child: Center(
                                child: IconButton(
                              onPressed: () {
                                Get.to(const AddCard());
                              },
                              icon: const Icon(
                                Icons.add_circle_outline_sharp,
                                size: 40,
                              ),
                            )),
                          ),
                        ),
                      ],
                      options: CarouselOptions(
                        autoPlay: false,
                        enlargeCenterPage: true,
                        viewportFraction: 0.7,
                        aspectRatio: 2.5,
                        initialPage: 2,
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      "Transfer to card",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    CustomInput(
                      hint: "Card number",
                      suffix: const Icon(
                        Icons.arrow_circle_right,
                        color: Colors.blue,
                        size: 40,
                      ),
                      miLenght: 16,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("Payments categories",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                    ],
                  ),
                ),
                Consumer<MainViewModel>(
                  builder: (context, value, child) {
                    return GridView.builder(
                      shrinkWrap: true,
                      primary: false,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3, childAspectRatio: 3 / 3),
                      itemCount: value.categoryList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: PaymentCategories(
                              value.categoryList[index].id.toString(),
                              text: value.categoryList[index].title,
                              url: value.categoryList[index].image),
                        );
                      },
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("Payments history",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                    ],
                  ),
                ),
                Consumer<MainViewModel>(
                  builder: (context, value, child) {
                    return ListView.builder(
                      shrinkWrap: true,
                      primary: false,
                      itemCount: value.paymentHistory.length,
                      itemBuilder: (context, index) {
                        var item = value.paymentHistory[index];
                        return Container(
                          decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: Colors.grey, width: 0.5))),
                          child: ListTile(
                            title:
                                Text(maskCardNumber(item.from_card.toString())),
                            subtitle: Text(item.date),
                            trailing: Text(item.summa.toString()),
                            leading: Icon(
                              Icons.file_download_outlined,
                              color: Colors.blue,
                            ),
                          ),
                        );
                      },
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

String maskCardNumber(String cardNumber) {
  if (cardNumber.length <= 6) {
    // If the card number has 6 or fewer digits, return it as is
    return cardNumber;
  }

  final firstFourDigits = cardNumber.substring(0, 4);
  final lastTwoDigits = cardNumber.substring(cardNumber.length - 2);
  final maskedDigits = '*' * (cardNumber.length - 6);

  return '$firstFourDigits$maskedDigits$lastTwoDigits';
}
