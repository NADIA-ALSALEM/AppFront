import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medforall/colors.dart';
class DropMenueWidget extends StatefulWidget {
  final List<String> options; // Accept gender options as a parameter
  final String labelText;
  final String hintText;
  final Function(String)
      onSelected; // Callback function to handle the selected value

  // Constructor to initialize gender options
  DropMenueWidget(
      {required this.options,
      required this.hintText,
      required this.labelText,
      required this.onSelected});

  @override
  _GenderWidgetState createState() => _GenderWidgetState();
}

class _GenderWidgetState extends State<DropMenueWidget> {
  // Variable to store selected gender
  String? _selectedOption;

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
              // Dropdown field for gender selection
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: _selectedOption,
                  hint: Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Text(
                      widget.hintText,
                      style: TextStyle(
                        color: Color.fromRGBO(127, 127, 127, 1),
                        fontFamily: 'Montserrat',
                        fontSize: 12,
                        // Match TextInput hint size
                        fontWeight: FontWeight.normal,
                        height: 1,
                      ),
                    ),
                  ),
                  items: widget.options.map((String value) {
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
                      _selectedOption = newValue;
                    });
                    widget.onSelected(_selectedOption ?? "");
                  },
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
                    widget.labelText, // Gradient header text
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
