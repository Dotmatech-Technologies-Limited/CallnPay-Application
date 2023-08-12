import 'package:flutter/material.dart';



class Dashboard extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 80, 20, 20),
              child: Container(
                height: 64,
                child: Row(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 22,
                      backgroundImage: NetworkImage(
                          "https://media.istockphoto.com/id/1438708701/photo/black-and-white-image-taken-in-the-60s-children-siblings-posing-together.jpg?s=612x612&w=0&k=20&c=jG96TNIGT9saFGEk03bZGSj0slIDbw7oooEhVNf2_qs="),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                      child: Text(
                        "Hello, John ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {},
                          child: Image(image: AssetImage("assets/images/notification.png"))),
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: 130,
              width: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color.fromRGBO(1, 31, 120, 1),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      'Total Balance',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          "₦128,039",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: Colors.white),
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Icon(
                          Icons.remove_red_eye_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 200,
              width: 350,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    )
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      DashboardButtons(
                          image: 'assets/images/Vector.png', text: "Fund"),
                      DashboardButtons(
                          image: "assets/images/transfer.png",
                          text: "Transfer"),
                      DashboardButtons(
                          image: "assets/images/paymentIcon.png",
                          text: "Payment"),
                    ],
                  ),
                  Row(
                    children: [
                      DashboardButtons(
                          image: "assets/images/save.png", text: "Savings"),
                      DashboardButtons(
                          image: "assets/images/bank.png", text: "Utilities"),
                      DashboardButtons(
                          image: "assets/images/phone.png", text: "Airtime"),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
                child: Container(
                  height: 200,
                  child: Row(
                    children: [
                      ScrollingCard(image: "assets/images/savings.png",
                          subText: "You can now do all your regular savings in one place",
                          superText: "Collo Savings"),
                          SizedBox(width: 10,),
                      ScrollingCard(image: "assets/images/savings.png",
                          subText: "You can now do all your regular savings in one place",
                          superText: "Collo Savings"),
                      SizedBox(width: 10,),
                      ScrollingCard(image: "assets/images/savings.png",
                          subText: "You can now do all your regular savings in one place",
                          superText: "Collo Savings", )
                    ],
                  ),
                ),
            )
          ],
        ),
      ]),

    );
  }
}

class ScrollingCard extends StatelessWidget {
  final String image;
  final String superText;
  final String subText;


  const ScrollingCard(
      {super.key,
      required this.image,
      required this.subText,
      required this.superText});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: 350,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            )
          ]),
      child: Row(
        children: [
          SizedBox(
            width: 25,
          ),
          Image(image: AssetImage(image)),
          Spacer(),
          Container(
            width: 200,
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Text(
                    superText,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo[900]),
                  ),
                ),
                Text(
                  subText,
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    'Open account >>',
                    style: TextStyle(color: Colors.indigo[900]),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class DashboardButtons extends StatelessWidget {
  final String image;
  final String text;

  const DashboardButtons({super.key, required this.image, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(33, 2, 20, 0),
          child: GestureDetector(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.all(5),
              height: 50.0,
              width: 50.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  image: DecorationImage(
                    image: AssetImage(image),
                  ),
                  color: Colors.blue[50]),
            ),
          ),
        ),
        Text(text)
      ],
    );
  }
}
