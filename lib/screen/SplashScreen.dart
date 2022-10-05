import 'package:animated_splash_screen/animated_splash_screen.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../main.dart';
import 'mainScreen.dart';


class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        children: [
          Image.asset('images/bubt3.png'),
          const Text("BUBT ICPC 2021" , style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,color: Colors.white),),

        ],
      ),
      backgroundColor: Colors.red
      , nextScreen: MyApp(),
      splashIconSize: 190,
      duration: 3500,
      splashTransition: SplashTransition.scaleTransition,

    );
  }
}
