import 'dart:async';

import 'package:callnpay_app/components/customBlueButton.dart';
import 'package:callnpay_app/components/otpForm.dart';
import 'package:callnpay_app/profile/verify_phoneNumber.dart';
import 'package:flutter/material.dart';

import 'create_account.dart';


class VerifyEmail extends StatefulWidget {

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  int start = 59;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: BackButton(
            onPressed: () {
              //Navigator.push(context, MaterialPageRoute(builder: (context) => CreateAccount()));
              Navigator.pop(context);
            },
          ),
        ),
      body: Column( crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(padding: EdgeInsets.fromLTRB(15, 10, 10, 0),
          child: Text("Verify Email",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 32,
              color: Color.fromRGBO(1, 31, 120, 1)
            ),
          ),
          ),
          Column(
            children: [
              Padding(padding: EdgeInsets.fromLTRB(15, 5, 10, 25),
              child: Column( crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('We sent a verification email to '),
                  Row(
                  children: [Text('callnpay@gmail.com.', style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(1, 31, 120, 1)
                  ),
                  ),
                  Text(' Please input the code')
                  ])
                ],
              ),
              )
            ],
          ),
          Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              OTPForm(),
              OTPForm(),
              OTPForm(),
              OTPForm(),
              OTPForm(),
              OTPForm(),
            ],
          ),
        SizedBox(height: 30,),
        Row( mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (start == 0) ...{
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Code expired! ",
                      ),
                      TextSpan(
                        text: "Resed Code",
                        style: TextStyle(color: Color.fromRGBO(1, 31, 120, 1))
                      )
                    ]
                  ),
                )
            } else ...{
              RichText(
                text: TextSpan(
                    children: [
                      TextSpan(
                        text: "This code will expire in ",
                          style: TextStyle(color: Colors.grey)
                      ),
                      TextSpan(
                          text: "00:$start",
                          style: TextStyle(color: Color.fromRGBO(1, 31, 120, 1))
                      )
                    ]
                ),
              )
            }
          ],
        ),
          Spacer(),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 10, 40),
          child: CustomBlueButton(text: 'Verify Mail', onPressed: () {
              showDialog(context: context, builder: (context) {
                return Dialog(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  elevation: 16,
                  child: Container(
                    width: 300,
                    height: 400,
                    child: Column(
                      children: [
                        buildImage('assets/images/congratulations.png'),
                        Text('Email Verified!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 32,
                          color: Color.fromRGBO(1, 31, 120, 1)
                        ),),
                        //Spacer(),
                        Text('Your email has been successfully verified',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                          ),),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                          child: CustomBlueButton(text: 'Proceed', onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => VerifyPhoneNumber()));
                          }),
                        ),
                      ],
                    ),
                  ),
                );
              }

              );
          }),
        )
        ],
      ),
    );
  }

  void startTimer() {
    const onSec = Duration(seconds: 1);
    Timer timer = Timer.periodic(onSec, (timer) {
      if (start == 0) {
        setState(() {
          timer.cancel();
        });
      } else {
        setState(() {
          start--;
        });
      }
    }
    );
  }

  Widget buildImage(String path) =>
      Padding(
        padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
        child: Center(child: Image.asset(path, width: 150)),
      );
}
