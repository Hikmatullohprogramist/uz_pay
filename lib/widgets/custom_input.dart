// ignore_for_file: use_key_in_widget_constructors, must_be_immutable, unrelated_type_equality_checks

import 'package:flutter/material.dart';

class CustomInput extends StatefulWidget {
  String text;
  String hint;
  Color? fillColor;
  TextInputType inputType;
  int miLenght;
  TextEditingController? controller;
  Widget? suffix;
  Widget? prefix;


  CustomInput(
      {this.hint = "",
      this.text = "",
      this.fillColor,
      this.inputType = TextInputType.text,
      this.miLenght = 6,
      this.controller,
        this.suffix,
        this.prefix

      });

  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  var errortext = "";
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.text,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        Container(
          width: 343,
          height: 56,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: widget.fillColor == "" ?const Color(0xffeef6f9) :widget.fillColor ,

          ),
          padding: const EdgeInsets.only(
            left: 20,
          ),

          child: TextField(
            controller: widget.controller,
            onChanged: (value) {
              setState(() {
                if(widget.miLenght != 0) {
                  if (value.length < widget.miLenght) {
                    errortext = "Minimum ${widget.miLenght} ta bo`lishi kerak";
                  } else {
                    errortext = "";
                  }
                }
                else
                  {
                    errortext = "";

                  }
              });
              
            },
            keyboardType: widget.inputType,
          
            decoration: InputDecoration(
          suffix:widget.suffix,
                border: InputBorder.none, hintText: widget.hint,

            prefix: widget.prefix),
          
          ),
        ),
        if (errortext.isNotEmpty)
          Text(
            errortext,
            style: const TextStyle(fontSize: 16, color: Colors.red),
          )
      ],
    );
  }
}
