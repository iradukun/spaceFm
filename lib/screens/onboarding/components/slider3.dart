import 'package:flutter/material.dart';

import '../../../components/custom_button.dart';
import '../../../constants/images.dart';
import '../../../themes/colors.dart';
import '../../../themes/fontsize.dart';
import 'custom_bottomsheet.dart';

class SlideItem3 extends StatelessWidget {
  const SlideItem3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children:[
        const Positioned(
          top: 80,
          left: 60,
          child: Text("Collect best \ndigital art now...", style: TextStyle(fontSize: mediumFont, color: primaryTextColor)),
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
                    child: Image.asset(onBoarding3Slider1),
                  ),
                ),
                Positioned(
                  left: 50,
                  top: 50,
                  child: SizedBox(
                    height: 100,
                    width: 100,
                    child: Image.asset(onBoarding3Slider2),
                  ),
                ),
                Positioned(
                  right: 50,
                  top: 150,
                  child: SizedBox(
                    height: 100,
                    width: 100,
                    child: Image.asset(onBoarding3Slider3),
                  ),
                ),
                Positioned(
                  left: 100,
                  top: 250,
                  child: SizedBox(
                    height: 100,
                    width: 100,
                    child: Image.asset(onBoarding3Slider4),
                  ),
                ),
                Positioned(
                  left: 80,
                  top: 450,
                  child: SizedBox(
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    child: const Text(
                      "“ Blockchain-based ownership and \nauthenticity verification. Each NFT is \nunique and verifiable. ”",
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