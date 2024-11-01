
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medforall/colors.dart';

class TextInput extends StatefulWidget {
  final String labelText;
  final String hintText;
  final TextInputType inputType;
  final TextEditingController controller;
  final bool obscureText;

  TextInput({
    required this.labelText,
    required this.hintText,
    this.inputType = TextInputType.none,
    required this.controller,
    this.obscureText = false,
  });

  @override
  _TestInputState createState() => _TestInputState();
}
class _TestInputState extends State<TextInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // Ensures it stretches to fill the parent width
      margin: EdgeInsets.symmetric(horizontal: 10), // Horizontal margin of 10
      height: 90,
      child: Stack(
        children: <Widget>[
          // Input container with shadow and rounded corners
          Positioned(
            top: 20,
            left: 5,
            right: 5, // Ensure it takes up the available width
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.25),
                    offset: Offset(0, 1),
                    blurRadius: 2,
                  )
                ],
                color: Colors.white,
              ),
              // Input field
              child: TextField(
                controller: widget.controller,
                obscureText: widget.obscureText,
                keyboardType: widget.inputType,
                decoration: InputDecoration(
                  hintText: widget.hintText,
                  hintStyle: TextStyle(
                    color: Color.fromRGBO(127, 127, 127, 1),
                    fontFamily: 'Montserrat',
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    height: 1,
                  ),
                  border: InputBorder.none, // Remove border to match design
                  contentPadding: EdgeInsets.only(left: 16, bottom: 0),
                ),
              ),
            ),
          ),
          // Gradient header at the top
          Positioned(
            top: 4,
            left: 17,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.25),
                    offset: Offset(0, 1),
                    blurRadius: 2,
                  )
                ],
                gradient: LinearGradient(
                  begin: Alignment(0.77, -0.25),
                  end: Alignment(0.25, 0.77),
                  colors: [
                    AppColors.primaryColor,
                    AppColors.primaryColor,
                  ],
                ),
              ),
              padding: EdgeInsets.symmetric(horizontal: 11, vertical: 6),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    widget.labelText,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Montserrat',
                      fontSize: 13,
                      fontWeight: FontWeight.normal,
                      height: 1,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
