import 'dart:async';

import 'package:callnpay_app/profile/setup_pin.dart';
import 'package:flutter/material.dart';

import '../components/customBlueButton.dart';
import '../components/otpForm.dart';
import 'create_account.dart';

class VerifyNumber extends StatefulWidget {
  const VerifyNumber({Key? key}) : super(key: key);

  @override
  State<VerifyNumber> createState() => _VerifyNumberState();
}

class _VerifyNumberState extends State<VerifyNumber> {
  int start = 59;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column( crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(padding: EdgeInsets.fromLTRB(15, 10, 10, 0),
            child: Text("Verify Number",
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
                    Text('We sent a verification code to '),
                    Row(
                        children: [Text('+23482473488484', style: TextStyle(
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
            child: CustomBlueButton(text: 'Next', onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => SetupPin()));
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

}

