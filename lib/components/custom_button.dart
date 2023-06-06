import 'package:flutter/material.dart';

import '../themes/colors.dart';
import '../themes/fontsize.dart';

class CustomButton extends StatelessWidget {
  final bool isGradient;
  final String buttonName;
  final VoidCallback onPressed;
  final String icon;
  final double elevation;
  const CustomButton({Key? key, required this.buttonName, required this.onPressed, this.icon = '', this.isGradient = true, this.elevation = 2.0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: 
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          primary: Colors.transparent,
          elevation: elevation
        ),
        onPressed: onPressed,
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            gradient: isGradient ? gradient : null,
          ),
          child: Container(
            constraints: const BoxConstraints(
              maxHeight: 50.0,
            ),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon == '' ? Container() :Image.asset(icon),
                const SizedBox(width: 8),
                Text(
                  buttonName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: smallFont,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}