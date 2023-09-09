import 'package:flutter/material.dart';

import '../components/customBlueButton.dart';
import '../components/pinScreen.dart';
import 'createpin_success.dart';

class ConfirmPin extends StatelessWidget {
  final String pin;
  const ConfirmPin({
    Key? key,
    required this.pin,
  }) : super(key: key);

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
          Padding(
            padding: EdgeInsets.fromLTRB(15, 10, 10, 0),
            child: Text(
              "Confirm Pin",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                  color: Color.fromRGBO(1, 31, 120, 1)),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(15, 0, 10, 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Enter your 4-digit pin again"),
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          NumberPadScreen(
            onCompleted: (val) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SetupPinSuccess(),
                ),
              );
            },
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 5, 10, 10),
            child: CustomBlueButton(
                text: "Continue",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SetupPinSuccess(),
                    ),
                  );
                }),
          )
        ],
      )),
    );
  }
}
