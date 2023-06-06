import 'package:flutter/material.dart';

import '../../../constants/images.dart';
import '../../../themes/colors.dart';
import '../../../themes/fontsize.dart';

class RadioPlayerScreen2 extends StatefulWidget {
  const RadioPlayerScreen2({Key? key}) : super(key: key);

  @override
  State<RadioPlayerScreen2> createState() => _RadioPlayerScreen2State();
}

class _RadioPlayerScreen2State extends State<RadioPlayerScreen2> {
  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    final double imageSize = MediaQuery.of(context).size.width;
    return DraggableScrollableSheet(
      initialChildSize: 0.97,
      minChildSize: 0.97,
      maxChildSize: 0.97,
      builder: (BuildContext context, ScrollController controller) {
        return Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(
              top: Radius.circular(10),
            ),
            image: DecorationImage(
              image: AssetImage(backgroundImage),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    controller: controller,
                    children: [
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          Image.asset(playing),
                          const Text(' Now playing', style: TextStyle(fontSize: mediumFont, color: primaryColor)),
                          const Spacer(),
                          GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: Image.asset(arrowDown),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Image.asset(radio2,
                          height: imageSize,
                          width: imageSize,
                            //fit: BoxFit.cover,
                          ),
                          const Text('Twenty one pilots',style: TextStyle(fontSize: smallFont, color: secondaryTextColor)),
                          const SizedBox(height: 5),
                          const Text('Stressed out',style: TextStyle(fontSize: largeFont, color: primaryTextColor)),
                         // const SizedBox(height: 15),
                          Image.asset(wavesplay),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(favorite),
                              Image.asset(paused, height: 100, width: 100,),
                              Image.asset(upload),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(previous),
                    const Text('Connect',style: TextStyle(fontSize: mediumFont, color: primaryTextColor)),
                    Image.asset(next),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}