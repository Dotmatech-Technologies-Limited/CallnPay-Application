import 'package:callnpay_app/components/signup_form.dart';
import 'package:callnpay_app/components/textfield/labelled_field.dart';
import 'package:callnpay_app/profile/profile_picture.dart';
import 'package:flutter/material.dart';

import '../components/checkBox.dart';
import '../components/customBlueButton.dart';

class BasicDetails extends StatefulWidget {
  const BasicDetails({Key? key}) : super(key: key);

  @override
  State<BasicDetails> createState() => _BasicDetailsState();
}

class _BasicDetailsState extends State<BasicDetails> {
  final _formKey = GlobalKey<FormState>();
  bool _loading = false;
  bool _checked = false;
  late TextEditingController country;
  late TextEditingController state;
  late TextEditingController zipcode;
  late TextEditingController city;
  late TextEditingController address1;
  late TextEditingController address2;
  late TextEditingController dob;

  @override
  void initState() {
    country = TextEditingController();
    state = TextEditingController();
    zipcode = TextEditingController();
    city = TextEditingController();
    address1 = TextEditingController();
    address2 = TextEditingController();
    dob = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    country.dispose();
    state.dispose();
    zipcode.dispose();
    city.dispose();
    address1.dispose();
    address2.dispose();
    dob.dispose();
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
                'Basic Details',
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
                      controller: country,
                      label: 'Country',
                      labelText: 'Enter Country',
                    ),
                    LabelledFormfield(
                      controller: state,
                      label: 'State',
                      labelText: 'Enter State',
                    ),
                    LabelledFormfield(
                      controller: zipcode,
                      label: 'Zip Code',
                      labelText: "Enter Code",
                      number: true,
                    ),
                    LabelledFormfield(
                      controller: city,
                      label: 'City',
                      labelText: 'Enter City',
                    ),
                    LabelledFormfield(
                      controller: address1,
                      label: 'Address Line 1',
                      labelText: 'Enter address 1',
                    ),
                    LabelledFormfield(
                      controller: address2,
                      label: 'Address Line 2',
                      labelText: 'Enter address 2',
                    ),
                    LabelledFormfield(
                      controller: dob,
                      label: 'Date of Birth',
                      labelText: 'Enter date of birth',
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
                  text: "Continue",
                  onPressed: () {
                    // if (_checked) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfilePicture(
                          country: country.text,
                          state: state.text,
                          zipCode: zipcode.text,
                          city: city.text,
                          addressLine1: address1.text,
                          addressLine2: address2.text,
                          dateOfBirth: dob.text,
                        ),
                      ),
                    );
                    // }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
