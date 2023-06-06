import 'package:flutter/material.dart';

import '../../../constants/images.dart';
import '../../../themes/colors.dart';
import '../../../themes/fontsize.dart';

class RadioPlayerScreen1 extends StatefulWidget {
  final String location, name, image;
  const RadioPlayerScreen1({Key? key,required this.location, required this.name, required this.image}) : super(key: key);

  @override
  State<RadioPlayerScreen1> createState() => _RadioPlayerScreen1State();
}

class _RadioPlayerScreen1State extends State<RadioPlayerScreen1> {
  bool max = true;
  @override
  Widget build(BuildContext context) {
    final double imageSize = MediaQuery.of(context).size.width;
    return
     max ? DraggableScrollableSheet(
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
                            onTap: () {
                              setState(() {
                                max = false;
                              });
                            },
                            child: Image.asset(arrowDown)
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          widget.image == '' ? Image.network(
                            widget.image,
                            height: imageSize,
                            width: imageSize,
                            fit: BoxFit.cover,
                          )
                          : Image.asset(profile,
                            height: imageSize,
                            width: imageSize,
                            fit: BoxFit.cover,
                          ),
                          Text(widget.location,style: const TextStyle(fontSize: smallFont, color: secondaryTextColor)),
                          const SizedBox(height: 5),
                          Text(widget.name.toString(),style: const TextStyle(fontSize: largeFont, color: primaryTextColor)),
                         // const SizedBox(height: 15),
                          Image.asset(waves),
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
    )
    : DraggableScrollableSheet(
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.favorite_outline, color: Colors.white, size: 20),
                              const SizedBox(width: 10),
                              const Icon(Icons.pause, color: Colors.white, size: 20),
                              const SizedBox(width: 10),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    max = true;
                                  });
                                },
                                child: const Icon(Icons.keyboard_arrow_up_outlined, color: Colors.white, size: 35)
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  
  }
}