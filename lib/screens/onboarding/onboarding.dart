import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../constants/images.dart';
import '../../themes/colors.dart';
import 'components/slider1.dart';
import 'components/slider2.dart';
import 'components/slider3.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  @override
  Widget build(BuildContext context) {
    PageController controller = PageController();
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: 
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(onBoardingBackground),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              PageView(
                controller: controller,
                children: const[
                  SlideItem1(),
                  SlideItem2(),
                  SlideItem3(),
                ],
              ),
              Container(
                alignment: const Alignment(0, 0.90),
                child: SmoothPageIndicator(
                  controller: controller, 
                  count: 3,
                  effect: const ExpandingDotsEffect(
                    dotHeight: 5,
                    dotWidth: 5,
                    dotColor: secondaryTextColor,
                    activeDotColor: primaryTextColor,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}