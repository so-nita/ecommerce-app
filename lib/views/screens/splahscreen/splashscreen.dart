import 'package:a2ecommerceapp/views/screens/authScreens/loginScreen.dart';
import 'package:a2ecommerceapp/views/screens/authScreens/registerScreen.dart';
import 'package:a2ecommerceapp/views/screens/home/homeScreen.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAllNamed('/login'); // Navigate to login page after 3 seconds
    });
    return AnimatedSplashScreen(
      splash: Column(
        children: [
          Center(
            child: Lottie.network(
              "https://lottie.host/96251843-3703-44b8-8131-62b00119a75e/1xyfFJnipz.json",
            ),
          ),
        ],
      ),
      nextScreen: LoginScreen(),
      splashIconSize: 400,
      splashTransition: SplashTransition.fadeTransition,
      backgroundColor: Colors.blueAccent,
    );
  }
}
