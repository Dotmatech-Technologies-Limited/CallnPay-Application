import 'package:flutter/material.dart';

import 'accounts_screen.dart';

class TargetSavings extends StatelessWidget {
  const TargetSavings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AccountsScreen()));
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 10, 0),
              child: Text('Target Savings',
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
                    'See your savings breakdown',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Container(
                    height: 170,
                    width: 300,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Colors.deepPurple.shade400, Colors.deepPurple.shade700]
                      ),
                      borderRadius: BorderRadius.circular(20),

                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Row(
                            children: [
                              Container(
                                height: 20,
                                width: 120,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white
                                ),
                                child: Center(
                                  child: Text(
                                    'Collo savings',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.purple,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              SizedBox(width: 5,),
                              Text("Transaction History >",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold
                                ),
                              )
                            ],
                          ),
                        ),
                        Spacer(),
                        Row(
                          children: [
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 8, 15, 0),
                              child: Image(image: AssetImage("assets/images/wifi.png")),
                            )
                          ],
                        ),

                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 0, 15),
                          child: Column(
                            children: [
                              Text("Total Balance", style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                                color: Colors.white
                              ),
                              ),
                              Text(
                                  "₦128,039",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24,
                                      color: Colors.white),
                                ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  height: 165,
                  width: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        )
                      ]
                  ),
                  child: Center(
                    child: Icon(
                      Icons.add,
                      size: 40,
                      color: Colors.grey,
                    ),
                  ),
                )
              ],
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(20, 15, 30, 20),
              child: Row(
                children: [
                  TargetSavingsButtons(text: 'Fund Wallet',
                    image: "assets/images/transferArrow.png",
                    boxColor: Color(0xffcbefff),
                    textColor: Color(0xff007DE8),),
                  SizedBox(width: 10,),
                  TargetSavingsButtons(text: 'Transfer',
                    image: "assets/images/withdrawArrow.png",
                    boxColor: Color(0xffeeeeee),
                    textColor: Color(0xff00B212),)
                ],
              ),
            ),
            Container(
                width: 375,
                height: 421,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, top: 20, bottom: 10),
                    child: Text("Account", style:
                    TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.left,),
                  ),
                 // SizedBox(height: 30,),
                  TargetSavingsRows(image: "assets/images/bank.png", majorText: 'Make Payments', subText: 'View your account details',),
                  SizedBox(height: 30,),
                  TargetSavingsRows(image: "assets/images/bank.png", majorText: 'Account Details', subText: 'View your account details', ),
                  SizedBox(height: 30,),
                  TargetSavingsRows(image: "assets/images/bank.png", majorText: 'Card', subText: 'View and manage your card', ),
                  SizedBox(height: 30,),
                  TargetSavingsRows(image: "assets/images/bank.png", majorText: 'Lock Card', subText: 'Disable this card temporarily', ),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TargetSavingsRows extends StatelessWidget {
  final String majorText;
  final String subText;
  final String image;
  final icon;
  const TargetSavingsRows({
    super.key,
    required this.image,
    required this.subText,
    this.icon,
    required this.majorText
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 0, 10, 0),
      child: Row(
        children: [
          Row(
            children: [
               Image.asset(
                image,
                width: 30,
                height: 44,
              ),
              SizedBox(width: 20,),
              Column( crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      majorText,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      )
                  ),
                  Text(
                      subText,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      )
                  )
                ],
              ),
              SizedBox(width: 20,),

            ],
          ),
        ],
      ),
    );
  }
}

class TargetSavingsButtons extends StatelessWidget {
  final String text;
  final String image;
  final boxColor;
  final textColor;
  const TargetSavingsButtons({
    super.key,
    required this.text,
    this.textColor,
    required this.image,
    this.boxColor
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 165,
        height: 46,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: boxColor),
        //Color(0xffcbefff)
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          children: [
            SizedBox(width: 9,),
            Image(image: AssetImage(image)),
            //"assets/images/transferArrow.png"
            SizedBox(width: 9,),
            Text(text,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: textColor
              //Color(0xff007DE8)
            ),)
          ],
        ),
      ),
    );
  }
}
