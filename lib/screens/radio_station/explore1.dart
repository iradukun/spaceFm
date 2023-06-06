import 'package:flutter/material.dart';

import '../../components/custom_button.dart';
import '../../constants/images.dart';
import '../../routes/route_manager.dart';
import '../../themes/colors.dart';
import '../../themes/fontsize.dart';
import 'components/custom_button.dart';

class ExploreScreen1 extends StatefulWidget {
  const ExploreScreen1({Key? key}) : super(key: key);

  @override
  State<ExploreScreen1> createState() => _ExploreScreen1State();
}

class _ExploreScreen1State extends State<ExploreScreen1> {
  @override
  Widget build(BuildContext context) {
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
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: ListView(
                          children: [
                            const SizedBox(height: 100),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(fmlogo),
                                const SizedBox(width: 10),
                                Image.asset(arrowLeftRight),
                                const SizedBox(width: 10),
                                Image.asset(meta),
                              ],
                            ),
                            const SizedBox(height: 30),
                            const Text('Connect your wallet', style: TextStyle(fontSize: largeFont, color: primaryTextColor), textAlign: TextAlign.center),
                            const SizedBox(height: 20),
                            const Text('Connect to one of our wallet provider or create a new one. Your crypto wallet securely stores', style: TextStyle(fontSize: smallFont, color: secondaryTextColor), textAlign: TextAlign.center),
                            const SizedBox(height: 40),
                            CustomButtonExplore(buttonName: 'MetaMask',onPressed: () => {}, gradient: gradient1, icon: metaMaskIcon),
                            CustomButtonExplore(buttonName: 'Coinbase Wallet',onPressed: () => {}, gradient: gradient2, icon: coinBaseWalletIcon),
                            CustomButtonExplore(buttonName: 'WalletConnect',onPressed: () => {}, gradient: gradient3, icon: walletConnectIcon),
                            const SizedBox(height: 20),
                            CustomButton(buttonName: 'Connect later',onPressed: () => Navigator.of(context).pushNamed(RouterManager.explore2), isGradient: false),
                          ],
                        ),
                      ),
                    ),
                    Container(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom :60.0),
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: const TextSpan(
                              style: TextStyle(
                                fontSize: smallFont, 
                                color: secondaryTextColor
                              ),
                              children: [
                                TextSpan(text: 'By connecting your wallet, you agree to our '),
                                TextSpan(text: 'Terms and Service.', style: TextStyle(decoration: TextDecoration.underline, color: primaryTextColor)),
                                TextSpan(text: ' Also consult our '),
                                TextSpan(text: 'Privacy Policy.', style: TextStyle(decoration: TextDecoration.underline, color: primaryTextColor)),
                              ],
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
             
            ),
          ),
        ],
      ),
    );
  }
}