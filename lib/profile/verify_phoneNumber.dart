import 'package:callnpay_app/components/customBlueButton.dart';
import 'package:callnpay_app/profile/verify_number.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../providers/functions/auth.dart';

class VerifyPhoneNumber extends StatelessWidget {
  const VerifyPhoneNumber({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(15, 10, 10, 0),
              child: Text(
                'Phone Number',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                  color: Color.fromRGBO(1, 31, 120, 1),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(15, 0, 10, 10),
              child: Text(
                'Enter your phone number to create\nan account',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(15, 0, 15, 10),
                  child: IntlPhoneField(
                    decoration: InputDecoration(
                        labelText: 'Phone Number',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blueGrey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.purple),
                          borderRadius: BorderRadius.circular(10),
                        )),
                    onChanged: (value) async {
                      if (value.number.length == 10) {
                        // setState(() {
                        //   _loading = true;
                        // });
                        await AuthFunctions().addPhoneNumber(
                          context: context,
                          countryCode: value.countryCode,
                          phoneNumber: value.number,
                        );
                        // if (mounted) {
                        //   setState(() {
                        //     _loading = false;
                        //   });
                        // }
                      }
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 380,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
              child: CustomBlueButton(
                  text: "Next",
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => VerifyNumber(),
                    //   ),
                    // );
                  }),
            )
          ],
        ),
      ]),
    );
  }
}
