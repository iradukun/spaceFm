import 'package:flutter/material.dart';

import '../../../constants/images.dart';
import '../../../themes/colors.dart';
import '../../../themes/fontsize.dart';

class Minimize extends StatefulWidget {
  const Minimize({Key? key}) : super(key: key);

  @override
  State<Minimize> createState() => _MinimizeState();
}

class _MinimizeState extends State<Minimize> {
  @override
  Widget build(BuildContext context) {
    
    TextEditingController email = TextEditingController();
    final double imageSize = MediaQuery.of(context).size.width;
    return
    DraggableScrollableSheet(
      initialChildSize: 0.1,
      minChildSize: 0.1,
      maxChildSize: 0.1,
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
                      Row(
                        children: [
                          Column(
                            children: [
                              Image.asset(radio1, height: 50, width: 50,),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const[
                               Text('88.1 KJZZ', style: TextStyle(fontSize: smallFont-2, color: primaryColor)),
                               Text('United state - Dalas', style: TextStyle(fontSize: smallFont-2, color: secondaryTextColor)),
                            ],
                          ),
                          const Spacer(),
                          // GestureDetector(
                          //   onTap: () => Navigator.pop(context),
                          //   child: Image.asset(arrowDown),
                          // ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(Icons.favorite_outline, color: Colors.white, size: 20),
                              SizedBox(width: 10),
                              Icon(Icons.pause, color: Colors.white, size: 20),
                              SizedBox(width: 10),
                              Icon(Icons.keyboard_arrow_up_outlined, color: Colors.white, size: 35),
                              //Image.asset(favorite),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Image.asset(previous),
                //     const Text('Connect',style: TextStyle(fontSize: mediumFont, color: primaryTextColor)),
                //     Image.asset(next),
                //   ],
                // ),
              ],
            ),
          ),
        );
      },
    );
  
  }
}