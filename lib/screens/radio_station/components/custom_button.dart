import 'package:flutter/material.dart';

import '../../../themes/fontsize.dart';

class CustomButtonExplore extends StatelessWidget {
  final Gradient gradient;
  final String buttonName;
  final VoidCallback onPressed;
  final String icon;
  final double elevation;
  const CustomButtonExplore({Key? key, required this.buttonName, required this.onPressed, this.icon = '', required this.gradient, this.elevation = 2.0}) : super(key: key);

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
            gradient: gradient,
          ),
          child: Container(
            constraints: const BoxConstraints(
              maxHeight: 50.0,
            ),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  buttonName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: smallFont,
                  ),
                ),
                const SizedBox(width: 8),
                Image.asset(icon),
              ],
            ),
          ),
        ),
      ),
    );
  }
}