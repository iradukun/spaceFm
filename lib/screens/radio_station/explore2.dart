import 'package:flutter/material.dart';
import 'package:space_fm_app/constants/images.dart';
import 'package:space_fm_app/screens/radio_station/radio_play2.dart';
import 'package:space_fm_app/themes/colors.dart';
import 'package:space_fm_app/themes/fontsize.dart';

import '../../services/api.dart';
import 'radio_play1.dart';

class ExploreScreen2 extends StatefulWidget {
  const ExploreScreen2({Key? key}) : super(key: key);

  @override
  State<ExploreScreen2> createState() => _ExploreScreen2State();
}

class _ExploreScreen2State extends State<ExploreScreen2> {
  /// List of Tab Bar Item
  List<String> items = [
    "All",
    "Top popular",
    "Favorites",
    "New stations",
  ];
  List dataList = [];
  int current = 0;


  @override
  Widget build(BuildContext context) {
   // Widget currentScreen = const Scaffold();

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(backgroundImage),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned.fill(
            child: SafeArea(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(profile),
                          const SizedBox(width: 10),
                          const Text(
                            'mywallet.spacefm',
                            style: TextStyle(
                              color: primaryTextColor,
                              fontSize: smallFont,
                            ),
                          ),
                          Image.asset(arrowDown),
                        ],
                      ),
                      Image.asset(notification),
                    ],
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Text(
                              "Radio station",
                              style: TextStyle(
                                fontSize: largeFont,
                                color: primaryTextColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 50,
                            width: double.infinity,
                            child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: items.length,
                              itemBuilder: (ctx, index) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      current = index;
                                    });
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      color: const Color(0XFF2C2C2E),
                                      borderRadius: BorderRadius.circular(30),
                                      gradient: current == index ? gradient : null,
                                    ),
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20.0, right: 20.0),
                                        child: index != 0
                                            ? Text(
                                                items[index],
                                                style: TextStyle(
                                                  color: current == index
                                                      ? primaryTextColor
                                                      : secondaryTextColor,
                                                ),
                                              )
                                            : Row(
                                                children: [
                                                  Text(
                                                    items[index],
                                                    style: TextStyle(
                                                      color: current == index
                                                          ? primaryTextColor
                                                          : secondaryTextColor,
                                                    ),
                                                  ),
                                                  const SizedBox(width: 5),
                                                  Container(
                                                    height: 15,
                                                    width: 15,
                                                    decoration: const BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: Colors.white,
                                                    ),
                                                    child: const Center(
                                                      child: Text(
                                                        '20',
                                                        style: TextStyle(
                                                          fontSize: 10,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Text(
                              'Tranding stations',
                              style: TextStyle(
                                fontSize: smallFont,
                                color: primaryTextColor,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              rectangleShape(2, 1.5, trading1),
                              Column(
                                children: [
                                  rectangleShape(1, 1.3, trading2),
                                  rectangleShape(1, 1.3, trading3),
                                ],
                              ),
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Text(
                              'Radio for all',
                              style: TextStyle(
                                fontSize: smallFont,
                                color: primaryTextColor,
                              ),
                            ),
                          ),
                          FutureBuilder(
                            future: ApiData().getData(),
                            builder: (context, snapshot) {
                              if (snapshot.hasError) {
                                return const Text(
                                  "Something went wrong",
                                );
                              }
                              if (snapshot.connectionState == ConnectionState.done) {
                                dataList = snapshot.data as List;
                                return Center(
                                  child: 
                                  current == 0 || current == 1 ?
                                  Wrap(
                                    runSpacing: 20.0,
                                    children: List<Widget>.generate(dataList.length, (index) {
                                      final double circleSize = current == 0 ? MediaQuery.of(context).size.width / 3.2 : MediaQuery.of(context).size.width / 2;
                                      
                                      return GestureDetector(
                                        onTap: (() {
                                          showModalBottomSheet(
                                            isScrollControlled: true,
                                            context: context,
                                            backgroundColor: Colors.transparent,
                                            builder: (context) => RadioPlayerScreen1(name: dataList[index]["Name"], location: dataList[index]["Location"], image: dataList[index]["Streaming_link"]),
                                          );
                                        }),
                                        child: Column(
                                          children: [
                                            Container(
                                              width: circleSize,
                                              height: circleSize,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.transparent,
                                                border: Border.all(
                                                  color: secondaryTextColor,
                                                  width: 1.0,
                                                ),
                                              ),
                                              child: dataList[index]["Streaming_link"] == null ? Image.network(
                                                dataList[index]["Streaming_link"],
                                                fit: BoxFit.cover,
                                              )
                                              : Image.asset(profile,
                                              fit: BoxFit.cover,
                                              ),
                                            ),
                                            FittedBox(
                                              fit: BoxFit.fitWidth, 
                                              child:Text(dataList[index]["Name"], style: const TextStyle(color: primaryTextColor, fontSize: smallFont - 4))
                                            )
                                          ],
                                        ),
                                      );
                                    }),
                                  )
                                  :const Text('', style: TextStyle(color: primaryTextColor, fontSize: smallFont) ),
                                );
                              }
                              return const Center(child: CircularProgressIndicator());
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.large(
        backgroundColor: Colors.transparent,
        child: Image.asset(tab3, fit: BoxFit.fill,),
        onPressed: (){},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        elevation: 0.0,
        child: Container(
          height: 60,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              // topLeft: Radius.circular(50.0),
              // topRight: Radius.circular(50.0),
            ),
            image: DecorationImage(
              image: AssetImage(backgroundImage),
             fit: BoxFit.cover,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //left side
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: (){
                      setState(() {
                        // currentScreen = const Scaffold();
                        // currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:[
                        Image.asset(tab1)
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: (){
                      setState(() {
                        // currentScreen = const Scaffold();
                        // currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(tab2)
                      ],
                    ),
                  ),
                ],
              ),
              //Right side
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: (){
                      setState(() {
                        // currentScreen = const Scaffold();
                        // currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(tab4)
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: (){
                      setState(() {
                        // currentScreen = const Scaffold();
                        // currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(tab5)
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
   
    );
  }

Widget rectangleShape(height, width, image){
  final double rectangleSize = MediaQuery.of(context).size.width / 3;
  return Container(
    height: rectangleSize * height,
    width: rectangleSize * width,
    decoration: BoxDecoration(
      color: Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: secondaryTextColor,
          width: 1.0,
      )
    ),
    child: Image.asset(image,
     fit: BoxFit.cover,
    ),
  );
}

Widget circleShape(dataList) => Center(
  child: 
  current == 0 || current == 1 ?
  Wrap(
    runSpacing: 20.0,
    children: List<Widget>.generate(dataList.length, (index) {
      final double circleSize = current == 0 ? MediaQuery.of(context).size.width / 3.2 : MediaQuery.of(context).size.width / 2;
      
      return Column(
        children: [
          Container(
            width: circleSize,
            height: circleSize,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.transparent,
              border: Border.all(
                color: secondaryTextColor,
                width: 1.0,
              ),
            ),
            child: dataList[index]["Streaming_link"] == null ? Image.network(
              dataList[index]["Streaming_link"],
              fit: BoxFit.cover,
            )
            : Image.asset(profile,
             fit: BoxFit.cover,
            ),
          ),
          FittedBox(
            fit: BoxFit.fitWidth, 
            child:Text(dataList[index]["Name"], style: const TextStyle(color: primaryTextColor, fontSize: smallFont - 4))
          )
        ],
      );
    }),
  )
  :const Text('', style: TextStyle(color: primaryTextColor, fontSize: smallFont) ),
);

}