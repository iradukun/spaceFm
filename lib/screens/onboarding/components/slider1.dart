import 'package:flutter/material.dart';
import 'package:space_fm_app/components/custom_button.dart';
import 'package:space_fm_app/screens/onboarding/components/custom_bottomsheet.dart';

import '../../../constants/images.dart';
import '../../../themes/colors.dart';
import '../../../themes/fontsize.dart';

class SlideItem1 extends StatelessWidget {
  const SlideItem1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children:[
        const Positioned(
          top: 80,
          left: 60,
          child: Text("The new era of \nMusic & Radio", style: TextStyle(fontSize: mediumFont, color: primaryTextColor)),
        ),
        Positioned(
          top: 120,
          child: Center(
            child: Stack(
              children: [
                SizedBox(
                  height: 500,
                  width: MediaQuery.of(context).size.width,
                ),
                Positioned(
                  right: 0,
                  child: SizedBox(
                    height: 100,
                    width: 50,
                    child: Image.asset(onBoarding1Slider1),
                  ),
                ),
                Positioned(
                  left: 50,
                  top: 50,
                  child: SizedBox(
                    height: 100,
                    width: 100,
                    child: Image.asset(onBoarding1Slider2),
                  ),
                ),
                Positioned(
                  right: 50,
                  top: 150,
                  child: SizedBox(
                    height: 100,
                    width: 100,
                    child: Image.asset(onBoarding1Slider3),
                  ),
                ),
                Positioned(
                  left: 100,
                  top: 250,
                  child: SizedBox(
                    height: 100,
                    width: 100,
                    child: Image.asset(onBoarding1Slider4),
                  ),
                ),
                Positioned(
                  left: 100,
                  top: 450,
                  child: SizedBox(
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    child: const Text(
                      "“ Listen to streaming radio daily: \nHip Hop, R&B, Reggaeton, Jazz \nBlues, EDM, Techno, Dance ”",
                      style: TextStyle(
                        fontSize: smallFont,
                        color: primaryTextColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 50,
          width: MediaQuery.of(context).size.width,
          child: CustomButton(
            buttonName: 'Get started',
            onPressed: () {
              showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                backgroundColor: Colors.transparent,
                builder: (context) => const CustomBottomSheet()
              );
            }
          )
        ),
      ],
    );
  }
}