import 'package:flutter/material.dart';

import '../components/customBlueButton.dart';
import '../components/signup_form.dart';
import 'basic_details.dart';



class SetupPinSuccess extends StatelessWidget {
  const SetupPinSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            Spacer(),
            buildImage('assets/images/setUp.png'),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
              child: Text('Pin Created Successfully!',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                    color: Color.fromRGBO(1, 31, 120, 1)
                ),),
            ),
            //Spacer(),
            Text('You can now verify and authorize transactions with your pin.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
              ),),
            Spacer(),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: CustomBlueButton(text: 'Proceed', onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => BasicDetails()));
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