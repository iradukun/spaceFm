import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:space_fm_app/providers/google_signin.dart';

import '../../../components/custom_button.dart';
import '../../../constants/images.dart';
import '../../../themes/colors.dart';
import '../../../themes/fontsize.dart';
import '../../test_auth.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GoogleSignIn _googleSignIn = GoogleSignIn();
    Future<UserCredential> signInWithGoogle() async {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;

      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      return await FirebaseAuth.instance.signInWithCredential(credential);
    }

    Future<UserCredential> signInWithFacebook() async {
      // Trigger the sign-in flow
      final LoginResult result = await FacebookAuth.instance.login();

      // Check if the login was successful
      if (result.status == LoginStatus.success) {
        // Retrieve the access token and create a credential
        final AccessToken accessToken = result.accessToken!;
        final OAuthCredential credential = FacebookAuthProvider.credential(accessToken.token);

        // Sign in to Firebase with the credential
        return await FirebaseAuth.instance.signInWithCredential(credential);
      } else {
        // Handle sign-in errors
        throw FirebaseAuthException(
          code: 'Facebook sign-in failed',
          message: result.message,
        );
      }
    }
    return DraggableScrollableSheet(
      initialChildSize: 0.85,
      minChildSize: 0.85,
      maxChildSize: 0.85,
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
              Expanded(
                child: ListView(
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
                   const Text('Start for Space FM', style: TextStyle(fontSize: mediumFont, color: primaryTextColor), textAlign: TextAlign.center),
                   const SizedBox(height: 20),
                   const Text('Create a profile, follow other accounts, make your own videos, and more.', style: TextStyle(fontSize: smallFont, color: secondaryTextColor), textAlign: TextAlign.center),
                   const SizedBox(height: 25),
                   CustomButton(buttonName: 'Continue with email',
                   onPressed: () { 
                    // Navigator.pop(context);
                    // showModalBottomSheet(
                    //   isScrollControlled: true,
                    //   context: context,
                    //   backgroundColor: Colors.transparent,
                    //   builder: (context) => const SignUpWithEmail()
                    // );
                   },
                   icon: emailIcon, isGradient: false),
                   CustomButton(
                    buttonName: 'Continue with Facebook',
                    onPressed: () async{
                      try {
                        UserCredential userCredential = await signInWithFacebook();
                        // User signed in successfully
                      } catch (e) {
                        // Handle sign-in errors
                      }
                    },  
                    icon: facebookIcon, 
                    isGradient: false
                    ),
                   CustomButton(
                    buttonName: 'Continue with Google',
                    onPressed: () async{
                      final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
                      await provider.googleLogin();
                     // provider.logout();
                      // Check if the sign-in was successful
                      //print(provider.user);
                        if (provider.user != null) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => const HomePage()),
                          );
                        } else {
                          // Handle sign-in errors
                        }
                      //provider.logout();
                      // try {
                      //   UserCredential userCredential = await signInWithGoogle();
                      //    String userId = signInWithGoogle();
                      //   if (userId.isNotEmpty) {
                      //     // Google authentication successful, navigate to next screen
                      //     // Navigator.push(
                      //     //   context,
                      //     //   MaterialPageRoute(
                      //     //     builder: (context) => HomePage(userId: userId),
                      //     //   ),
                      //     // );
                      //   }
                      //   // User signed in successfully
                      // } catch (e) {
                      //   // Handle sign-in errors
                      // }
                    }, 
                    icon: googleIcon, 
                    isGradient: false
                   ),
                   CustomButton(buttonName: 'Continue with Apple',onPressed: () => {}, icon: appleIcon, isGradient: false),
                   CustomButton(buttonName: '',onPressed: () => {Navigator.pop(context)}, icon: arrowDownIcon, isGradient: false, elevation: 0.0),
                  ],
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
                        TextSpan(text: 'By signing up you will be accepting our '),
                        TextSpan(text: 'Terms and Conditions.', style: TextStyle(decoration: TextDecoration.underline, color: primaryTextColor)),
                        TextSpan(text: ' Also consult our '),
                        TextSpan(text: 'Privacy Policy.', style: TextStyle(decoration: TextDecoration.underline, color: primaryTextColor)),
                      ],
                    ),
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