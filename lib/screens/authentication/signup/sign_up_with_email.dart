import 'package:flutter/material.dart';

import '../../../components/custom_button.dart';
import '../../../components/custom_textfield.dart';
import '../../../constants/images.dart';
import '../../../themes/colors.dart';
import '../../../themes/fontsize.dart';
import 'email_verfication.dart';

class SignUpWithEmail extends StatefulWidget {
  const SignUpWithEmail({Key? key}) : super(key: key);

  @override
  State<SignUpWithEmail> createState() => _SignUpWithEmailState();
}

class _SignUpWithEmailState extends State<SignUpWithEmail> {
  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
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
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: ListView(
                    controller: controller,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                           const Text(''),
                           const Text('Login or Sign up', style: TextStyle(fontSize: mediumFont, color: primaryColor)),
                            //Image.asset(closeIcon),
                          GestureDetector(
                              onTap: () => Navigator.pop(context),
                              child: const Icon(Icons.close_rounded, color: secondaryTextColor,)
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 40),
                      const Text('Enter your email',style: TextStyle(fontSize: largeFont, color: primaryTextColor)),
                      const SizedBox(height: 30),
                      CustomTextField(textController: email, hintText: 'Email address', inputType: TextInputType.emailAddress),
                      const SizedBox(height: 20),
                      const Text('You’ll receive a 4 digit code to verify next.',style: TextStyle(fontSize: smallFont, color: primaryTextColor)),
                      const SizedBox(height: 30),
                      CustomButton(
                        buttonName: 'Continue',
                        //isGradient: _isTyping ? true : false,
                        isGradient: false,
                        onPressed: (){
                          showModalBottomSheet(
                            isScrollControlled: true,
                            context: context,
                            backgroundColor: Colors.transparent,
                            builder: (context) => const EmailVerfication()
                          );
                        }, 
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