import 'package:flutter/material.dart';

import '../../../components/custom_button.dart';
import '../../../constants/images.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.95,
      minChildSize: 0.95,
      maxChildSize: 0.95,
      builder: (BuildContext context, ScrollController controller) {
        return Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(
              top: Radius.circular(20),
            ),
            image: DecorationImage(
              image: AssetImage(backgroundImage),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              ListView(
                controller: controller,
                children: [
                  Center(
                    child: Container(
                      margin: const EdgeInsets.all(16),
                      width: 50,
                      height: 4,
                      decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                 const SizedBox(height: 15),
                 CustomButton(buttonName: 'Continue',onPressed: () => {}, icon: emailIcon, isGradient: false),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}