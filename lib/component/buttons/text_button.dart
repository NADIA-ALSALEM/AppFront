import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class CostumeTextButton extends StatefulWidget {
  final String text;
  final TextStyle style;
  final void Function() onClick;  // Corrected the function type

  CostumeTextButton({
    required this.text,
    required this.style,
    required this.onClick,
  });

  @override
  _CostumeTextButtonState createState() => _CostumeTextButtonState();
}

class _CostumeTextButtonState extends State<CostumeTextButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: widget.onClick,  // onPressed expects a void function
      child: Text(
        widget.text,
        style: widget.style,
      ),
    );
  }
}