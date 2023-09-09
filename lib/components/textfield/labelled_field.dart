import 'package:flutter/material.dart';

class LabelledFormfield extends StatefulWidget {
  final String label, labelText;
  final TextEditingController? controller;
  final bool email, number, password, obscureText;
  const LabelledFormfield({
    Key? key,
    required this.labelText,
    this.controller,
    required this.label,
    this.obscureText = false,
    this.email = false,
    this.number = false,
    this.password = false,
  }) : super(key: key);

  @override
  State<LabelledFormfield> createState() => _LabelledFormfieldState();
}

class _LabelledFormfieldState extends State<LabelledFormfield> {
  final bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(1, 15, 5, 5),
          child: Text(
            widget.label,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ),
        TextFormField(
          controller: widget.controller,
          obscureText: widget.password ? _isObscure : false,
          keyboardType: widget.number
              ? TextInputType.number
              : widget.email
                  ? TextInputType.emailAddress
                  : TextInputType.text,
          decoration: InputDecoration(
            labelText: widget.labelText,
            contentPadding: const EdgeInsets.symmetric(
              vertical: 0,
              horizontal: 10,
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.blueGrey,
              ),
            ),
            border: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.purple,
              ),
            ),
          ),
          validator: (value) {
            if (value?.isEmpty ?? true) {
              return 'Required';
            } else {
              return null;
            }
          },
        ),
      ],
    );
  }
}
