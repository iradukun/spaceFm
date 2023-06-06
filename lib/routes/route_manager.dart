import 'package:flutter/material.dart';
import 'package:space_fm_app/screens/radio_station/minimized.dart';

import '../screen_not_found.dart';
import '../screens/authentication/login/login.dart';
import '../screens/authentication/signup/email_verfication.dart';
import '../screens/authentication/signup/sign_up_with_email.dart';
import '../screens/onboarding/onboarding.dart';
import '../screens/radio_station/explore1.dart';
import '../screens/radio_station/explore2.dart';
import '../screens/splash/splash.dart';

// Define custom router manager class
class RouterManager {
  static const String splash = '/';
  static const String onboard = '/onboard';
  static const String login = '/login';
  static const String signUpWithEmail = '/signUpWithEmail';
  static const String emailVerfication = '/emailVerfication';
  static const String explore1 = '/explore1';
  static const String explore2 = '/explore2';
  //static const String radio1 = '/radio1';
  static const String min = '/min';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // Add named routes here
      case splash:
        return MaterialPageRoute(builder: (context) => const SplashScreeen());
      case onboard:
        return MaterialPageRoute(builder: (context) => const OnBoardScreen());
      case login:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case signUpWithEmail:
        return MaterialPageRoute(builder: (context) => const SignUpWithEmail());
      case emailVerfication:
        return MaterialPageRoute(builder: (context) => const EmailVerfication());
      case explore1:
        return MaterialPageRoute(builder: (context) => const ExploreScreen1());
      case explore2:
        return MaterialPageRoute(builder: (context) => const ExploreScreen2());
      // case radio1:
      //   return MaterialPageRoute(builder: (context) => const RadioPlayerScreen1());
      case min:
        return MaterialPageRoute(builder: (context) => const Minimize());
      default:
        // Handle unknown routes
        return MaterialPageRoute(builder: (context) => const ScreenNotFound());
    }
  }
}
