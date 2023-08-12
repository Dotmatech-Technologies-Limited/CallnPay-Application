import 'package:callnpay_app/introduction_screens/onboardingScreen.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash ({Key? key}) : super (key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
   // _navigatetoonboardingscreen();
  }

  _navigatetoonboardingscreen()async{
    await Future.delayed(Duration(milliseconds: 1500), () {});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => OnboardingScreen()));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text('CallnPay', style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
    ));
  }
}
