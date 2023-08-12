import 'dart:math';

import 'package:flutter/material.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.fromLTRB(15, 5, 15, 10),
      child: Column(
       children: [
         singleFormView(label: 'Username', labelText: 'Enter Username'),
         singleFormView(label: 'Password', labelText: "Enter Password", email: false, password: true, obscureText: true),
         singleFormView(label: 'Confirm Password', labelText: 'Confirm Password', password: true, obscureText: true),
         singleFormView(label: 'Email', labelText: 'Enter Email', email: true),
         singleFormView(label: 'First Name', labelText: 'First Name'),
         singleFormView(label: 'Last Name', labelText: 'Last Name')
       ],
      ),
    );
  }

  Column singleFormView({label, labelText, email = false, password = false, obscureText = false}) {
    return Column( crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Padding(
               padding: const EdgeInsets.fromLTRB(1, 15, 5, 5),
               child: Text(label, style: TextStyle(
                 fontSize: 14,
                 fontWeight: FontWeight.w500
               ),),

             ),
             TextFormField(
               obscureText: password ? _isObscure : false,
               keyboardType: email ? TextInputType.emailAddress : TextInputType.text,
               decoration: InputDecoration(
                 labelText: labelText,
                 contentPadding: EdgeInsets.symmetric(vertical: 0,
                 horizontal: 10),
                 enabledBorder: OutlineInputBorder(
                   borderSide: BorderSide(
                     color: Colors.blueGrey
                   )
                 ),
                   border: OutlineInputBorder(
                     borderSide: BorderSide(
                       color: Colors.purple
                     )
                   ),
               ),
             )
           ],
         );
  }
}

class BasicDetailsForm extends StatefulWidget {
  const BasicDetailsForm({Key? key}) : super(key: key);

  @override
  State<BasicDetailsForm> createState() => _BasicDetailsFormState();
}

class _BasicDetailsFormState extends State<BasicDetailsForm> {
  bool _isNumber = true;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.fromLTRB(15, 5, 15, 10),
      child: Column(
        children: [
          singleFormView(label: 'Country', labelText: 'Enter Country'),
          singleFormView(label: 'State', labelText: 'Enter State'),
          singleFormView(label: 'Zip Code', labelText: "Enter Code", isNumber: true),
          singleFormView(label: 'City', labelText: 'Enter City'),
          singleFormView(label: 'Address Line 1', labelText: 'Enter address 1'),
          singleFormView(label: 'Address Line 2', labelText: 'Enter address 2'),
          singleFormView(label: 'Date of Birth', labelText: 'Enter date of birth')
        ],
      ),
    );
  }

  Column singleFormView({label, labelText, isNumber = false}) {
    return Column( crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(1, 15, 5, 5),
          child: Text(label, style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500
          ),),

        ),
        TextFormField(

          keyboardType: _isNumber ? TextInputType.number : TextInputType.text,
          decoration: InputDecoration(
            labelText: labelText,
            contentPadding: EdgeInsets.symmetric(vertical: 0,
                horizontal: 10),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.blueGrey
                )
            ),
            border: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.purple
                )
            ),
          ),
        )
      ],
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.fromLTRB(15, 5, 15, 10),
      child: Column(
        children: [
          singleFormView(label: 'Email/Username', labelText: 'Enter Email/Username'),
          singleFormView(label: 'Password', labelText: 'Enter Password'),
        ],
      ),
    );
  }

  Column singleFormView({label, labelText}) {
    return Column( crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(1, 15, 5, 5),
          child: Text(label, style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500
          ),),

        ),
        TextFormField(
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            labelText: labelText,
            contentPadding: EdgeInsets.symmetric(vertical: 0,
                horizontal: 10),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.blueGrey
                )
            ),
            border: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.purple
                )
            ),
          ),
        )
      ],
    );
  }
}
