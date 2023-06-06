import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:uz_pay/screens/card/add/add_card_view_model.dart';
import 'package:uz_pay/widgets/custom_button.dart';
import 'package:uz_pay/widgets/custom_input.dart';

class AddCard extends StatefulWidget {
  const AddCard({Key? key}) : super(key: key);

  @override
  State<AddCard> createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  var cardNumberController = MaskedTextController(mask: '0000 0000 0000 0000');
  var cardDateController = MaskedTextController(mask: '00/00');
  var cardNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Add Card"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                CustomInput(
                  text: "Card name",
                  hint: "Input card name... ",
                  controller: cardNameController,
                  inputType: TextInputType.text,
                  miLenght: 3,
                ),
                CustomInput(
                  text: "Card Number",
                  hint: "Input card number... ",
                  controller: cardNumberController,
                  inputType: TextInputType.number,
                  miLenght: 16,
                ),
                SizedBox(
                  height: 16,
                ),
                CustomInput(
                    text: "Experied date",
                    hint: "Input date... ",
                    controller: cardDateController,
                    inputType: TextInputType.number,
                    miLenght: 5),
                SizedBox(
                  height: 48,
                ),
                Consumer<AddCardViewModel>(
                  builder: (context, value, child) {
                    return CustomButton(
                        text: "Add",
                        onclick: () {
                          value.addCard(
                            cardNameController.text,
                            cardNumberController.text.removeAllWhitespace,
                            cardDateController.text.replaceAll("/", ""),
                          );
                        });
                  },
                )
              ],
            ),
          ),
        ));
  }
}
