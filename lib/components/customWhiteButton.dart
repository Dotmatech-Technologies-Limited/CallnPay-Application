import 'package:flutter/material.dart';


class CustomWhiteButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  CustomWhiteButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          side: BorderSide(
            width: 1.0,
            color: Color.fromRGBO(1, 31, 120, 1),
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        backgroundColor: Colors.white
      ),


      child: Container(
        height: 50,
        width: 300,
        decoration: BoxDecoration(
          //border: Border.all(color: Color.fromRGBO(1, 31, 120, 1)),
          borderRadius: BorderRadius.circular(3.0)
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Text(
            text,
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Color.fromRGBO(1, 31, 120, 1)),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}



