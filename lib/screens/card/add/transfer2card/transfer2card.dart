import 'package:carousel_slider/carousel_slider.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:uz_pay/widgets/custom_button.dart';
import 'package:uz_pay/widgets/custom_input.dart';

import '../../../../utils/constantas.dart';
import '../../../main/main_view_mode.dart';
import '../add_card.dart';

class TransferToCard extends StatefulWidget {
  const TransferToCard({super.key});

  @override
  State<TransferToCard> createState() => _TransferToCardState();
}

class _TransferToCardState extends State<TransferToCard> {
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

  final CarouselController _carouselController = CarouselController();

  int cardIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Consumer<MainViewModel>(
              builder: (context, value, child) {
                return CarouselSlider(
                  carouselController: _carouselController,
                  disableGesture: false,
                  items: [
                    ...value.cardList
                        .mapIndexed((index, e) => ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Container(
                                color: Colors.white,
                                child: Stack(
                                  children: [
                                    Image.asset(
                                      cardBackgroundList[
                                          index % cardBackgroundList.length],
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
                                              value.cardList[index].card_number,
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
                                                    value.cardList[index].name,
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
                                                    fontWeight: FontWeight.w200,
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
                      onPageChanged: (index, reason) {
                        setState(() {
                          cardIndex = index;
                        });
                      },
                      autoPlay: false,
                      enlargeCenterPage: true,
                      viewportFraction: 0.7,
                      aspectRatio: 2.5,
                      initialPage: 2,
                      enableInfiniteScroll: false),
                );
              },
            ),
            const SizedBox(
              height: 20,
            ),
            CustomInput(
              text: "Transfer to card",
              hint: "Card number",
              fillColor: Colors.grey.shade100,
              miLenght: 16,
            ),
            const SizedBox(
              height: 40,
            ),
            CustomInput(
              text: "Transfer summa",
              hint: "Summa",
              fillColor: Colors.grey.shade100,
              miLenght: 16,
            ),
            CustomButton(
                text: "Transfer",
                onclick: () {
                  if (kDebugMode) {
                    print(cardIndex);
                  }
                })
          ],
        ),
      ),
    );
  }
}
