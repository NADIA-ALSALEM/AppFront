import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medforall/colors.dart';
class GenderWidget extends StatefulWidget {
  @override
  _GenderWidgetState createState() => _GenderWidgetState();
}

class _GenderWidgetState extends State<GenderWidget> {
  String? _selectedGender;

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
              // Dropdown field for gender selection
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: _selectedGender,
                  hint: Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Text(
                      'Your Gender',
                      style: TextStyle(
                        color: Color.fromRGBO(127, 127, 127, 1),
                        fontFamily: 'Montserrat',
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                        height: 1,
                      ),
                    ),
                  ),
                  items: ['Female', 'Male'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text(value),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedGender = newValue;
                    });
                  },
                  // Adding explicit dropdown arrow icon
                  icon: Icon(
                    Icons.arrow_drop_down, // Dropdown arrow icon
                    color: Colors.black, // Arrow color
                  ),
                  iconSize: 24, // Adjust icon size if needed
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
                    color: AppColors.primaryColor,
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
                    'Gender', // Gradient header text
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
