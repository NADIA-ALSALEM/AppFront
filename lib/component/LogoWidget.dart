import 'package:flutter/cupertino.dart';

class LogoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 183,
      height: 196,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/Logo.png'),
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
