import 'package:callnpay_app/components/signup_form.dart';
import 'package:callnpay_app/dashboard/home.dart';
import 'package:flutter/material.dart';

import '../components/customBlueButton.dart';
import '../components/textfield/labelled_field.dart';
import '../dashboard/main_home_screen.dart';
import '../providers/functions/auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _loading = false;
  bool _checked = false;
  late TextEditingController usernameController;
  late TextEditingController passwordController;

  @override
  void initState() {
    usernameController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(15, 10, 10, 0),
            child: Text('Login',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                    color: Color.fromRGBO(1, 31, 120, 1))),
          ),
          Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.fromLTRB(15, 5, 15, 10),
              child: Column(
                children: [
                  LabelledFormfield(
                    controller: usernameController,
                    label: 'Email/Username',
                    labelText: 'Enter Email/Username',
                  ),
                  LabelledFormfield(
                    controller: passwordController,
                    label: 'Password',
                    labelText: "Enter Password",
                    email: false,
                    password: true,
                    obscureText: true,
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 5, 30, 20),
            child: CustomBlueButton(
                text: "Continue",
                onPressed: () async {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MainHomeScreen(),
                    ),
                    (route) => false,
                  );
                  // if (_checked) {
                  //   setState(() {
                  //     _loading = true;
                  //   });
                  // await AuthFunctions().login(
                  //   context: context,
                  //   username: usernameController.text,
                  //   password: passwordController.text,
                  // );
                  //   if (mounted) {
                  //     setState(() {
                  //       _loading = false;
                  //     });
                  //   }
                  // }
                }),
          ),
          Center(
            child: InkWell(
              onTap: () {},
              child: Text(
                "Forgot Password?",
                style: TextStyle(fontSize: 16, color: Colors.indigo[900]),
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          )
        ],
      ),
    );
  }
}
