import 'package:flutter/cupertino.dart';
import 'package:medforall/colors.dart';

class TitleWidget extends StatefulWidget {

  final String title;

  TitleWidget({required this.title});

  @override
  _TitleWidgetState createState() => _TitleWidgetState();
}

class _TitleWidgetState extends State<TitleWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 188,
        height: 69,


        child: Stack(
            children: <Widget>[
              Positioned(

                  child: Text(
                    widget.title, textAlign: TextAlign.left, style: TextStyle(
                      color : AppColors.primaryColor,
                      fontFamily: 'Montserrat',
                      fontSize: 35,
                      letterSpacing: 0,

                      fontWeight: FontWeight.bold,
                      height: 1
                  ),)
              ),
            ]
        )
    );
  }
}
