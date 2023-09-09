import 'package:flutter/material.dart';

class CheckBox extends StatelessWidget {
  final bool isSelected;
  final Function() onTap;
  const CheckBox({
    super.key,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 2, 0, 0),
              child: GestureDetector(
                onTap: onTap,
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: Colors.black45)),
                  child: isSelected
                      ? const Icon(
                          Icons.check,
                          size: 17,
                          color: Colors.green,
                        )
                      : null,
                ),
              ),
            ),
            const Text(
              '  I agree to abide by the ',
            ),
            GestureDetector(
              onTap: () {},
              child: const Text(
                'terms ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(1, 31, 120, 1),
                ),
              ),
            ),
            const Text("and "),
            GestureDetector(
              onTap: () {},
              child: const Text(
                'conditions',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(1, 31, 120, 1),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
