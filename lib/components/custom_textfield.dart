import 'package:flutter/material.dart';

import '../themes/colors.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController textController;
  final TextInputType inputType;
  final String hintText;

  const CustomTextField(
      {Key? key,
      required this.textController,
      this.inputType = TextInputType.text,
      required this.hintText,
      }
      )
      : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: textFieldBBackgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        keyboardType: widget.inputType,
        controller: widget.textController,
        showCursor: false,
        style: const TextStyle(color: primaryTextColor),
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: const TextStyle(color: textFieldHintColor),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}