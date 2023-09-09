import 'package:callnpay_app/components/customBlueButton.dart';
import 'package:callnpay_app/components/signup_form.dart';
import 'package:callnpay_app/profile/verifyEmail.dart';
import 'package:flutter/material.dart';

import '../components/checkBox.dart';
import '../components/textfield/labelled_field.dart';
import '../providers/functions/auth.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final _formKey = GlobalKey<FormState>();
  bool _loading = false;
  bool _checked = false;
  late TextEditingController usernameController;
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;

  @override
  void initState() {
    usernameController = TextEditingController();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    usernameController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(15, 10, 10, 0),
              child: Text(
                'Create Account',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                  color: Color.fromRGBO(1, 31, 120, 1),
                ),
              ),
            ),
            const Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(15, 5, 10, 10),
                  child: Text(
                    'We need some basic information about you. Kindly enter them below',
                    style: TextStyle(fontSize: 16),
                  ),
                )
              ],
            ),
            Form(
              key: _formKey,
              child: Padding(
                padding: EdgeInsets.fromLTRB(15, 5, 15, 10),
                child: Column(
                  children: [
                    LabelledFormfield(
                      controller: usernameController,
                      label: 'Username',
                      labelText: 'Enter Username',
                    ),
                    LabelledFormfield(
                      controller: passwordController,
                      label: 'Password',
                      labelText: "Enter Password",
                      email: false,
                      password: true,
                      obscureText: true,
                    ),
                    LabelledFormfield(
                      controller: confirmPasswordController,
                      label: 'Confirm Password',
                      labelText: 'Confirm Password',
                      password: true,
                      obscureText: true,
                    ),
                    LabelledFormfield(
                      controller: emailController,
                      label: 'Email',
                      labelText: 'Enter Email',
                      email: true,
                    ),
                    LabelledFormfield(
                      controller: firstNameController,
                      label: 'First Name',
                      labelText: 'First Name',
                    ),
                    LabelledFormfield(
                      controller: lastNameController,
                      label: 'Last Name',
                      labelText: 'Last Name',
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            CheckBox(
              isSelected: _checked,
              onTap: () {
                setState(() {
                  _checked = !_checked;
                });
              },
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(18, 5, 15, 35),
              child: CustomBlueButton(
                text: "Register",
                loading: _loading,
                formKey: _formKey,
                onPressed: () async {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => VerifyEmail(),
                  //   ),
                  // );
                  if (_checked) {
                    setState(() {
                      _loading = true;
                    });
                    await AuthFunctions().register(
                      context: context,
                      emailAddress: emailController.text,
                      password: passwordController.text,
                      firstName: firstNameController.text,
                      lastName: lastNameController.text,
                      username: usernameController.text,
                    );
                    if (mounted) {
                      setState(() {
                        _loading = false;
                      });
                    }
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
