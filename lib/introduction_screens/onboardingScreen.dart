import 'package:callnpay_app/components/customBlueButton.dart';
import 'package:callnpay_app/components/customWhiteButton.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../profile/create_account.dart';
import '../profile/login_screen.dart';


class OnboardingScreen extends StatelessWidget {
   const OnboardingScreen({Key? key}) : super(key : key);

  @override
  Widget build(BuildContext context) => SafeArea( top: false, bottom: false,
      child: IntroductionScreen(
        pages: [
          PageViewModel(
            title: '100% Secured Transacations',
            body: 'Every transactions carried out is secured. You have nothing to worry about',
            image: buildImage('assets/images/onboardingimage.png'),
            decoration: getPageDecoration(),
            useScrollView: false
            //footer: ElevatedButton
          ),
          PageViewModel(
            title: 'We’re SEC Compliant',
            body: 'Every transactions carried out is secured. You have nothing to worry about',
            image: buildImage('assets/images/onboardingimage2.png'),
            decoration: getPageDecoration(),
            useScrollView: false,
            footer: Column(
               children: [
                 Padding(
                   padding: const EdgeInsets.all(5.0),
                   child: CustomBlueButton(
                     text: 'Sign up',
                     onPressed: () {
                       Navigator.push(context, MaterialPageRoute(builder: (context) => CreateAccount()));
                     }
                   ),
                 ),
                 Padding(
                   padding: const EdgeInsets.all(5.0),
                   child: CustomWhiteButton(
                       text: 'Login',
                       onPressed: () {
                         Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                       }
                   ),
                 )
               ],
            )
          )
        ],
      )

  );

   Widget buildImage(String path) =>
       Padding(
         padding: const EdgeInsets.fromLTRB(10, 110, 10, 0),
         child: Center(child: Image.asset(path, width: 350)),
       );

   PageDecoration getPageDecoration() => PageDecoration(
     titleTextStyle: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Color.fromRGBO(1, 31, 120, 1)),
     bodyTextStyle: TextStyle(fontSize: 16),
     descriptionPadding: EdgeInsets.all(16).copyWith(bottom: 0),
       imagePadding: EdgeInsets.all(24),
     pageColor: Colors.white,
   );
}