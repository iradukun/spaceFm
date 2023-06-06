import 'package:flutter/material.dart';
import 'package:space_fm_app/themes/colors.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController textController;
  final TextInputType inputType;
  final String hintText;
  final bool obscureText;
  final Icon? suffixIcon;
  final TextAlign textAlign;
  final Color fillColor;
  final FocusNode focusNode;

  const CustomTextField(
      {Key? key,
      required this.textController,
      this.inputType = TextInputType.number,
      required this.hintText,
      this.obscureText = false,
      this.suffixIcon,
      this.textAlign = TextAlign.start,
      this.fillColor = textFieldBBackgroundColor,
      required this.focusNode,
      })
      : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: widget.inputType,
      focusNode: widget.focusNode,
      maxLength: 1,
      showCursor: false,
      style: const TextStyle(color: primaryTextColor),
      decoration: InputDecoration(
      filled: true,
      counter: const Offstage(),
      fillColor: widget.fillColor,
      hintText: widget.hintText,
      iconColor: Colors.grey,
      suffixIcon: widget.suffixIcon ?? widget.suffixIcon,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide.none,
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 10.0)),
      onChanged: (value) {
        if (value.isNotEmpty) {
          widget.focusNode.requestFocus();
        }
      },
      obscureText: widget.obscureText,
      textAlign: TextAlign.center,
    );
  }
}
