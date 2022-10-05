import 'package:animated_splash_screen/animated_splash_screen.dart';

import 'package:flutter/material.dart';
import 'package:map_1/screen/SplashScreen.dart';

void main() {
  runApp(const runApp1());
}

class runApp1 extends StatelessWidget {
  const runApp1({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'BUBT ICPC 2022',
        theme: ThemeData(
          // This is the theme of your application.

          primarySwatch: Colors.blue,
        ),
        home: Splash()
      //DataTableDemo(title: 'Flutter Demo Home Page'),
    );
  }
}