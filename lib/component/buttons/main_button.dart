import 'package:flutter/material.dart';

import '../../styles/main_text_style.dart';
import 'package:medforall/colors.dart';
class MainButton extends StatefulWidget {
  final String text;

  final VoidCallback onClick;

  MainButton({required this.text, required this.onClick});

  @override
  _MainButtonWidgetState createState() => _MainButtonWidgetState();
}

class _MainButtonWidgetState extends State<MainButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onClick,
      child: Container(
        width: 150, // Adjusted width for a more button-like appearance
        height: 50,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(0.77, -0.25),
            end: Alignment(0.25, 0.77),
            colors: [
              AppColors.primaryColor,
              AppColors.primaryColor,
            ],
          ),
          borderRadius: BorderRadius.circular(10), // Rounded corners
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              offset: Offset(0, 4),
              blurRadius: 5,
            ),
          ],
        ),
        child: Center(
          child: Text(
            widget.text,
            textAlign: TextAlign.center,
            style: textWhite,
          ),
        ),
      ),
    );
  }
}
