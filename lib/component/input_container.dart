import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medforall/colors.dart';
class InputFieldContainer extends StatelessWidget {
  final String title;
  final Widget child;

  InputFieldContainer({required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 20, // Full width minus margin
      height: 90,
      margin: EdgeInsets.symmetric(horizontal: 10), // Horizontal margin
      child: Stack(
        children: <Widget>[
          // Input container with shadow and rounded corners
          Positioned(
            top: 20,
            left: 5,
            child: Container(
              width: MediaQuery.of(context).size.width - 30, // Adjust width to match parent
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.25),
                    offset: Offset(0, 1),
                    blurRadius: 2,
                  ),
                ],
                color: Colors.white,
              ),
              // The child widget will be passed from the parent
              child: child,
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
                  ),
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
                    title, // The title passed from the parent
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
