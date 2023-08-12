import 'package:callnpay_app/components/customBlueButton.dart';
import 'package:callnpay_app/components/signup_form.dart';
import 'package:callnpay_app/profile/verifyEmail.dart';
import 'package:flutter/material.dart';

import '../components/checkBox.dart';


class CreateAccount extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column( crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 10, 0),
              child: Text('Create Account',
                style: TextStyle (
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                  color: Color.fromRGBO(1, 31, 120, 1)
                )
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 5, 10, 10),
                  child: Text('We need some basic information about you. Kindly enter them below',
                    style: TextStyle (
                      fontSize: 16
                    ),),
                )
              ],
            ),
              SignUpForm(),
            SizedBox(height: 15,),
            CheckBox(),
            SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.fromLTRB(18, 5, 15, 35),
              child: CustomBlueButton(text: "Register", onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => VerifyEmail()));
              }),
            )
          ],

        ),
      ),
    );
  }

}