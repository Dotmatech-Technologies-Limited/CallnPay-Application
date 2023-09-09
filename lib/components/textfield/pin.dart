import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PINField extends StatelessWidget {
  final int length;
  final Function(String) onCompleted;
  const PINField({
    super.key,
    required this.length,
    required this.onCompleted,
  });

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      // showCursor: false,
      autoFocus: true,
      beforeTextPaste: (text) => true,
      dialogConfig: null,
      appContext: context,
      length: length,
      obscureText: true,
      animationType: AnimationType.fade,
      hintCharacter: '-',
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        fieldHeight: 40,
        fieldWidth: 40,
        borderWidth: 1,
        borderRadius: BorderRadius.circular(4),
        activeFillColor: Colors.white,
        inactiveFillColor: Colors.white,
        activeColor: Color.fromRGBO(1, 31, 120, 1),
        inactiveColor: Colors.black54,
        selectedColor: Color.fromRGBO(1, 31, 120, 1),
        selectedFillColor: Colors.white,
      ),
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      textStyle: TextStyle(),
      backgroundColor: Colors.transparent,
      enableActiveFill: true,
      onCompleted: onCompleted,
      // onChanged: (value) {
      //   print(value);
      // },
    );
  }
}
