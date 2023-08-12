import 'package:flutter/material.dart';


class CheckBox extends StatefulWidget {


  @override
  State<CheckBox> createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBox> {
  bool _isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 2,0, 0),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                      _isSelected = !_isSelected;
                  });
                },
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: Colors.black45)),
                child: _isSelected ? Icon(Icons.check, size: 17, color: Colors.green,) : null,
                ),
              ),
            ),
            Text('  I agree to abide by the '),
            GestureDetector(
              onTap: () {},
              child:  Text('terms ', style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(1, 31, 120, 1)
              ),),
            ),
           Text("and "),
            GestureDetector(
              onTap: () {},
              child:  Text('conditions', style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(1, 31, 120, 1)
              ),),
            )
          ],
        )
      ],
    );
  }
}
