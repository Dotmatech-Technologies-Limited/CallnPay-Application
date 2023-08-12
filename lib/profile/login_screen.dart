import 'package:callnpay_app/components/signup_form.dart';
import 'package:callnpay_app/dashboard/home.dart';
import 'package:flutter/material.dart';

import '../components/customBlueButton.dart';
import '../dashboard/main_home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

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
      body: Column( crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 10, 0),
              child: Text('Login',
                  style: TextStyle (
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                      color: Color.fromRGBO(1, 31, 120, 1)
                  )
              ),
            ),
            LoginForm(),
            Spacer(),

            Padding(
              padding: const EdgeInsets.fromLTRB(30, 5, 30, 20),
              child: CustomBlueButton(text: "Continue", onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => MainHomeScreen()));
              }),
            ),

            Center(
              child: InkWell(
                onTap: () {},
                child: Text("Forgot Password?", style: TextStyle(
                  fontSize: 16,
                  color: Colors.indigo[900]
                ),),
              ),
            ),
            SizedBox(height: 40,)
          ],
        ),

    );
  }
}
