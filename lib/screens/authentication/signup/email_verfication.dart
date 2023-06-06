import 'package:flutter/material.dart';

import '../../../components/custom_button.dart';
import '../../../constants/images.dart';
import '../../../routes/route_manager.dart';
import '../../../themes/colors.dart';
import '../../../themes/fontsize.dart';
import '../components/custom_text_field.dart';

class EmailVerfication extends StatefulWidget {
  const EmailVerfication({Key? key}) : super(key: key);

  @override
  State<EmailVerfication> createState() => _EmailVerficationState();
}

class _EmailVerficationState extends State<EmailVerfication> {
//TextEditingController email = TextEditingController();
  TextEditingController digitOneController = TextEditingController();
  TextEditingController digitTwoController = TextEditingController();
  TextEditingController digitThreeController = TextEditingController();
  TextEditingController digitFourController = TextEditingController();

  FocusNode digitOneFocusNode = FocusNode();
  FocusNode digitTwoFocusNode = FocusNode();
  FocusNode digitThreeFocusNode = FocusNode();
  FocusNode digitFourFocusNode = FocusNode();

    @override
  void initState() {
  super.initState();

  digitOneController.addListener(() {
    if (digitOneController.text.length == 1) {
      digitTwoFocusNode.requestFocus();
    }
  });

  digitTwoController.addListener(() {
    if (digitTwoController.text.length == 1) {
      digitThreeFocusNode.requestFocus();
    }
  });

  digitThreeController.addListener(() {
    if (digitThreeController.text.length == 1) {
      digitFourFocusNode.requestFocus();
    }
  });

  digitFourController.addListener(() {
    if (digitFourController.text.length == 1) {
      digitFourFocusNode.unfocus();
    }
  });
  }
  @override
  void dispose() {
    digitOneController.dispose();
    digitTwoController.dispose();
    digitThreeController.dispose();
    digitFourController.dispose();

    digitOneFocusNode.dispose();
    digitTwoFocusNode.dispose();
    digitThreeFocusNode.dispose();
    digitFourFocusNode.dispose();

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.92,
      minChildSize: 0.92,
      maxChildSize: 0.92,
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ListView(
                    controller: controller,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: GestureDetector(
                              onTap: () => Navigator.pop(context),
                              child: Image.asset(backArrow)
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
                      const Text('Email verification',style: TextStyle(fontSize: largeFont, color: primaryTextColor), textAlign: TextAlign.center),
                      const SizedBox(height: 30),
                      RichText(
                        textAlign: TextAlign.center,
                        text: const TextSpan(
                          style: TextStyle(
                            fontSize: smallFont, 
                            color: secondaryTextColor
                          ),
                          children: [
                            TextSpan(text: 'We have sent code to '),
                            TextSpan(text: ' mao@gmail.com', style: TextStyle(color: primaryTextColor)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                       Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: 50.0,
                            child: CustomTextField(textController : digitOneController, hintText: '', focusNode: digitOneFocusNode),
                          ),
                          SizedBox(
                            width: 50.0,
                            child: CustomTextField(textController : digitTwoController, hintText: '', focusNode: digitTwoFocusNode),
                          ),
                          SizedBox(
                            width: 50.0,
                            child: CustomTextField(textController : digitThreeController, hintText: '', focusNode: digitThreeFocusNode),
                          ),
                          SizedBox(
                            width: 50.0,
                            child: CustomTextField(textController : digitFourController, hintText: '', focusNode: digitFourFocusNode),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      CustomButton(buttonName: 'Verify Account',onPressed: () => Navigator.of(context).pushNamed(RouterManager.explore1), isGradient: false),
                      const SizedBox(height: 20),
                      RichText(
                        textAlign: TextAlign.center,
                        text: const TextSpan(
                          style: TextStyle(
                            fontSize: smallFont, 
                            color: secondaryTextColor
                          ),
                          children: [
                            TextSpan(text: 'Didn’t receive code? '),
                            TextSpan(text: ' Resend', style: TextStyle(decoration: TextDecoration.underline, color: primaryTextColor, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}