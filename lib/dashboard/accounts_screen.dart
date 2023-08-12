import 'package:callnpay_app/components/customBlueButton.dart';
import 'package:callnpay_app/profile/login_screen.dart';
import 'package:flutter/material.dart';

import 'account_creation_success.dart';
import 'home.dart';
import 'main_home_screen.dart';

class AccountsScreen extends StatelessWidget {
  const AccountsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isSelected = false;
    bool isColloSavings = false;
    bool isPocketSavings = false;
    bool isGiftCard = false;
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => MainHomeScreen()));
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 10, 0),
              child: Text('Select Account',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                      color: Color.fromRGBO(1, 31, 120, 1))),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 5, 10, 10),
                  child: Text(
                    'Select an account type below',
                    style: TextStyle(fontSize: 16),
                  ),
                )
              ],
            ),
            Center(
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      isSelected = true;
                      isColloSavings = true;
                      isPocketSavings = false;
                      isGiftCard = false;
                    },
                    child: ScrollingCard(
                        image: "assets/images/savings.png",
                        subText:
                            "You can now do all your regular savings in one place",
                        superText: "Collo Savings"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      isSelected = true;
                      isColloSavings = false;
                      isPocketSavings = true;
                      isGiftCard = false;
                    },
                    child: ScrollingCard(
                        image: "assets/images/wallet_phone.png",
                        subText:
                            "You can now do all your regular savings in one place",
                        superText: "Pocket Savings"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      isSelected = true;
                      isColloSavings = false;
                      isPocketSavings = false;
                      isGiftCard = true;
                    },
                    child: ScrollingCard(
                        image: "assets/images/Gift card color.png",
                        subText:
                            "You can now do all your regular savings in one place",
                        superText: "Gift Cards"),
                  )
                ],
              ),
              //),
            ),
            SizedBox(height: 20,),
            Center(
              child: CustomBlueButton(
                  text: "proceed",
                  onPressed: () {
                    isColloSavings
                        ? Navigator.push(context, MaterialPageRoute(builder: (context) => AccountCreatedSuccessfully()))
                        : isPocketSavings
                            ? Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MainHomeScreen()))
                            : isGiftCard ? Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen())) : null;
                  }),
            )

          ],
        ),
      ),
    );
  }
}
