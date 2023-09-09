import 'package:callnpay_app/components/customBlueButton.dart';
import 'package:callnpay_app/components/otpForm.dart';
import 'package:callnpay_app/components/pinScreen.dart';
import 'package:flutter/material.dart';

import 'confirm_pin.dart';

class CreatePin extends StatefulWidget {
  const CreatePin({Key? key}) : super(key: key);

  @override
  State<CreatePin> createState() => _CreatePinState();
}

class _CreatePinState extends State<CreatePin> {
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
      body: Container(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(15, 10, 10, 0),
            child: Text(
              "Create Pin",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                  color: Color.fromRGBO(1, 31, 120, 1)),
            ),
          ),
          const Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(15, 0, 10, 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Enter a 4-digit pin you won't forget"),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          NumberPadScreen(
            onCompleted: (val) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ConfirmPin(
                    pin: val,
                  ),
                ),
              );
            },
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 5, 10, 10),
            child: CustomBlueButton(
              text: "Continue",
              onPressed: () {},
            ),
          )
        ],
      )),
    );
  }
}
