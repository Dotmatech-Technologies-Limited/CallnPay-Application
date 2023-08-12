import 'package:callnpay_app/dashboard/target_savings.dart';
import 'package:flutter/material.dart';

import '../components/customBlueButton.dart';


class AccountCreatedSuccessfully extends StatelessWidget {
  const AccountCreatedSuccessfully({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            Spacer(),
            buildImage('assets/images/Group 4895.png'),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Text('Account Created Successfully!',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                    color: Color.fromRGBO(1, 31, 120, 1)
                ),),
            ),
            //Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Your Collo Savings account has been successfully created.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                ),),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: CustomBlueButton(text: 'Proceed', onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => TargetSavings()));
              }),
            ),
            SizedBox(height: 45,)
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
