import 'package:flutter/material.dart';

import '../../../components/custom_button.dart';
import '../../../constants/images.dart';
import '../../../themes/colors.dart';
import '../../../themes/fontsize.dart';
import 'custom_bottomsheet.dart';

class SlideItem2 extends StatelessWidget {
  const SlideItem2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children:[
        const Positioned(
          child: Text(""),
        ),
        Positioned(
          top: 60,
          child: Center(
            child: Stack(
              children: [
                SizedBox(
                  height: 500,
                  width: MediaQuery.of(context).size.width,
                ),
                Positioned(
                  right: 150,
                  child: SizedBox(
                    height: 100,
                    width: 50,
                    child: Image.asset(onBoarding2Slider1),
                  ),
                ),
                Positioned(
                  right: 0,
                  child: SizedBox(
                    height: 100,
                    width: 50,
                    child: Image.asset(onBoarding2Slider2),
                  ),
                ),
                Positioned(
                  left: 50,
                  top: 150,
                  child: SizedBox(
                    height: 100,
                    width: 100,
                    child: Image.asset(onBoarding2Slider3),
                  ),
                ),
                Positioned(
                  right: 80,
                  top: 130,
                  child: SizedBox(
                    height: 100,
                    width: 100,
                    child: Image.asset(onBoarding2Slider4),
                  ),
                ),
                Positioned(
                  right: 30,
                  top: 250,
                  child: SizedBox(
                    height: 100,
                    width: 100,
                    child: Image.asset(onBoarding2Slider5),
                  ),
                ),
                Positioned(
                  left: 80,
                  top: 380,
                  child: SizedBox(
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    child: const Text(
                      "Connect your crypto \nwallet here...",
                      style: TextStyle(
                        fontSize: mediumFont,
                        color: primaryTextColor,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 80,
                  top: 450,
                  child: SizedBox(
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    child: const Text(
                      "Support for multiple cryptocurrencies \nand fiat currencies. Flexibility for all your \ntrading needs.",
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