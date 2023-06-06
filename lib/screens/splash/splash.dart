import 'package:flutter/material.dart';

import '../../constants/duration.dart';
import '../../constants/images.dart';
import '../../themes/colors.dart';

class SplashScreeen extends StatefulWidget {
  const SplashScreeen({Key? key}) : super(key: key);

  @override
  State<SplashScreeen> createState() => _SplashScreeenState();
}

class _SplashScreeenState extends State<SplashScreeen> {
  @override
  void initState() {
    super.initState();
   // Delay before navigating to the next screen
    Future.delayed(const Duration(seconds: duration), () {
      Navigator.pushReplacementNamed(context, '/onboard');
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 2,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(splashTopImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Center(
              child: Image.asset(splashCenteredImage),
            ),
          ],
        ),
      ),
    );
  }
}