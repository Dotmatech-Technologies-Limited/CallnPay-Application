import 'package:callnpay_app/components/customWhiteButton.dart';

import 'package:callnpay_app/profile/create_pin.dart';
import 'package:callnpay_app/profile/verify_number.dart';
import 'package:flutter/material.dart';

import '../components/customBlueButton.dart';
import '../dashboard/main_home_screen.dart';


class SetupPin extends StatelessWidget {
  const SetupPin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => VerifyNumber()));
          },
        ),
      ),
       body: Column(
          children: [
            buildImage('assets/images/setUp.png'),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
              child: Text('Setup Pin',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                    color: Color.fromRGBO(1, 31, 120, 1)
                ),),
            ),
            //Spacer(),
            Text('Your pin is a secure and easy way for you to authorize all your transactions',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
              ),),
            Spacer(),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: CustomBlueButton(text: 'Setup Pin', onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => CreatePin()));
              }),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 60),
              child: CustomWhiteButton(text: 'Skip', onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => MainHomeScreen()));
              }),
            ),

          ],
        )
    );
  }


  Widget buildImage(String path) =>
      Padding(
        padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
        child: Center(child: Image.asset(path, width: 200, height: 200,)),
      );
}
