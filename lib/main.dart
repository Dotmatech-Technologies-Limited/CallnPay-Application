//import 'dart:html';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:callnpay_app/introduction_screens/onboardingScreen.dart';
import 'package:callnpay_app/introduction_screens/splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: AnimatedSplashScreen(splash: Center(
        child: Container(
          child: Text('CallnPay', style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.white
          ),
          ),
        ),
      ),
          duration: 2000,
          backgroundColor: Color.fromRGBO(1, 31, 120, 1),
          splashTransition: SplashTransition.fadeTransition,
          nextScreen: OnboardingScreen()),
    );
  }
}


