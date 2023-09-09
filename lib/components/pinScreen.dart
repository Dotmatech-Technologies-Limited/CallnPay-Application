import 'package:flutter/material.dart';

import '../profile/confirm_pin.dart';

class NumberPadScreen extends StatefulWidget {
  final Function(String) onCompleted;
  const NumberPadScreen({
    Key? key,
    required this.onCompleted,
  }) : super(key: key);

  @override
  State<NumberPadScreen> createState() => _NumberPadScreenState();
}

class _NumberPadScreenState extends State<NumberPadScreen> {
  List<String> currentPin = ["", "", "", ""];
  TextEditingController pinOneController = TextEditingController();
  TextEditingController pinTwoController = TextEditingController();
  TextEditingController pinThreeController = TextEditingController();
  TextEditingController pinFourController = TextEditingController();

  var outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(4),
    borderSide: BorderSide(color: Colors.blueGrey),
  );
  int pinIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(8),
            child: buildPinRow(),
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 20, 0, 10),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25, 0, 30, 10),
                        child: KeyboardNumber(() {
                          print("i have been pressed");
                          pinIndexSetUp("1");
                        }, 1),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25, 0, 30, 10),
                        child: KeyboardNumber(() {
                          pinIndexSetUp("2");
                        }, 2),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25, 0, 5, 10),
                        child: KeyboardNumber(() {
                          pinIndexSetUp("3");
                        }, 3),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 20, 0, 10),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25, 0, 30, 10),
                        child: KeyboardNumber(() {
                          pinIndexSetUp("4");
                        }, 4),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25, 0, 30, 10),
                        child: KeyboardNumber(() {
                          pinIndexSetUp("5");
                        }, 5),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25, 0, 5, 10),
                        child: KeyboardNumber(() {
                          pinIndexSetUp("6");
                        }, 6),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 20, 0, 10),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25, 0, 30, 10),
                        child: KeyboardNumber(() {
                          pinIndexSetUp("7");
                        }, 7),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25, 0, 30, 10),
                        child: KeyboardNumber(() {
                          pinIndexSetUp("8");
                        }, 8),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25, 0, 5, 10),
                        child: KeyboardNumber(() {
                          pinIndexSetUp("9");
                        }, 9),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 20, 0, 10),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25, 0, 30, 10),
                        child: Container(
                          width: 60.0,
                          child: MaterialButton(
                            onPressed: null,
                            child: SizedBox(),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25, 0, 60, 10),
                        child: KeyboardNumber(() {
                          pinIndexSetUp("0");
                        }, 0),
                      ),
                      Container(
                        width: 60.0,
                        child: MaterialButton(
                          height: 60.0,
                          onPressed: () {
                            clearPin();
                          },
                          child: Icon(
                            Icons.cancel_rounded,
                            color: Colors.black45,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  clearPin() {
    if (pinIndex == 0)
      pinIndex = 0;
    else if (pinIndex == 4) {
      setPin(pinIndex, "");
      currentPin[pinIndex - 1] = "";
      pinIndex--;
    } else {
      setPin(pinIndex, "");
      currentPin[pinIndex - 1] = "";
      pinIndex--;
    }
  }

  pinIndexSetUp(String text) {
    if (pinIndex == 0) {
      pinIndex = 1;
    } else if (pinIndex < 4) {
      pinIndex++;
    }
    setPin(pinIndex, text);
    currentPin[pinIndex - 1] = text;
    String strPin = "";
    currentPin.forEach((e) {
      strPin += e;
    });
    if (pinIndex == 4) {
      print(strPin);
      widget.onCompleted(strPin);
    }
  }

  setPin(int n, String text) {
    switch (n) {
      case 1:
        pinOneController.text = text;
        break;
      case 2:
        pinTwoController.text = text;
        break;
      case 3:
        pinThreeController.text = text;
        break;
      case 4:
        pinFourController.text = text;
        break;
    }
  }

  buildPinRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        PINNumber(pinOneController, outlineInputBorder),
        PINNumber(pinTwoController, outlineInputBorder),
        PINNumber(pinThreeController, outlineInputBorder),
        PINNumber(pinFourController, outlineInputBorder)
      ],
    );
  }
}

class PINNumber extends StatelessWidget {
  final TextEditingController textEditingController;
  final OutlineInputBorder outlineInputBorder;

  PINNumber(this.textEditingController, this.outlineInputBorder);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 59,
      child: TextField(
        controller: textEditingController,
        enabled: false,
        obscureText: false,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(16.0),
            border: outlineInputBorder,
            filled: true),
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 21, color: Colors.black),
      ),
    );
  }
}

class KeyboardNumber extends StatelessWidget {
  final int n;
  final Function() onPressed;

  KeyboardNumber(this.onPressed, this.n);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      alignment: Alignment.center,
      child: MaterialButton(
        padding: EdgeInsets.all(6),
        onPressed: onPressed,
        height: 90,
        child: Text(
          "$n",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 24 * MediaQuery.of(context).textScaleFactor,
              fontWeight: FontWeight.bold,
              color: Colors.black),
        ),
      ),
    );
  }
}
