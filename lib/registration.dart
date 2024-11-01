import 'package:flutter/material.dart';
import 'package:medforall/component/LogoWidget.dart';
import 'package:medforall/component/buttons/dark_text_style.dart';
import 'package:medforall/component/buttons/text_button.dart';
import 'package:medforall/component/gender_widget.dart';
import 'package:medforall/component/buttons/main_button.dart';
import 'package:medforall/component/text_input.dart';
import 'package:medforall/component/title_widget.dart';
import 'package:medforall/models/RegisterUserRequest.dart';
import 'package:medforall/styles/gray_text_style.dart';
import 'login.dart';

class RegistrationWidget extends StatefulWidget {
  @override
  _RegistrationWidgetState createState() => _RegistrationWidgetState();
}

class _RegistrationWidgetState extends State<RegistrationWidget> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final List<String> cities = [
    'Amman',
    'Zarqa',
    'Irbid',
    'Aqaba',
    'Madaba',
    'Karak',
    'Jarash',
    'Ajloun',
    'Mafraq',
    'Tafila',
    'Ma\'an',
    'Albalqaa'
  ];

  // Declare a variable to store the selected value
  String selectedGender = '';
  String selectedCity = '';

  void handleGenderSelected(String value) {
    setState(() {
      selectedGender = value;
    });
    print("Selected Gender: $selectedGender");
  }

  void handleCitySelected(String value) {
    setState(() {
      selectedCity = value;
    });
    print("Selected City: $selectedCity");
  }

  // Button onClick handler to create RegistrationRequest
  void onSignUp() {
    // Create RegistrationRequest using values from controllers and selections
    RegistrationRequest registrationRequest = RegistrationRequest(
      firstName: firstNameController.text,
      lastName: lastNameController.text,
      email: emailController.text,
      phone: phoneController.text,
      password: passwordController.text,
      gender: selectedGender,
      city: selectedCity,
    );
    // You can now use this registrationRequest object, e.g., send it to an API
    print(registrationRequest.toString());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Stack(
                children: [
                  Component2Widget(),
                  Positioned(
                    top: -100,
                    left: -145,
                    child: Ellipse4Widget(),
                  ),
                  SingleChildScrollView(
                    child: Center(
                      // Center the whole widget
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(child: LogoWidget()),
                          Center(child: TitleWidget(title: "Signup")),
                          // Use Row to place TextInputs side by side
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Expanded widget to make TextInput take available space
                              Expanded(
                                child: TextInput(
                                  hintText: "Enter your first name",
                                  inputType: TextInputType.name,
                                  controller: firstNameController,
                                  labelText: "First name",
                                ),
                              ),
                              // Expanded widget to make TextInput take available space
                              Expanded(
                                child: TextInput(
                                  hintText: "Enter your last name",
                                  inputType: TextInputType.name,
                                  controller: lastNameController,
                                  labelText: "Last name",
                                ),
                              ),
                            ],
                          ),
                          TextInput(
                            hintText: "Enter your email",
                            inputType: TextInputType.emailAddress,
                            controller: emailController,
                            labelText: "email",
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Expanded widget to make TextInput take available space
                              Expanded(
                                child: TextInput(
                                  hintText: "+962 7xxxxxxxx",
                                  inputType: TextInputType.phone,
                                  controller: phoneController,
                                  labelText: "Mobile",
                                ),
                              ),
                              // Expanded widget to make TextInput take available space
                              Expanded(
                                child: DropMenueWidget(
                                  options: ["Male", "Female"],
                                  labelText: "Gender",
                                  hintText: "Your Gender",
                                  onSelected: handleGenderSelected,
                                ),
                              ),
                            ],
                          ),
                          DropMenueWidget(
                            options: cities,
                            labelText: "City",
                            hintText: "Your City",
                            onSelected: handleCitySelected,
                          ),
                          TextInput(
                            hintText: "Your password",
                            inputType: TextInputType.visiblePassword,
                            controller: passwordController,
                            labelText: "Password",
                            obscureText: true,
                          ),
                          TextInput(
                            hintText: "Re-enter password",
                            inputType: TextInputType.visiblePassword,
                            controller: confirmPasswordController,
                            labelText: "Confirm Password",
                            obscureText: true,
                          ),
                          MainButton(
                            text: "Sign up",
                            onClick: () {
                              onSignUp();
                            },
                          ),
                          SizedBox(height: 30),
                          // Add space between the button and the next row
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Already have an account?",
                                style: grayText,
                              ),
                              CostumeTextButton(
                                text: "Sign in",

                                style: darkText,
                                onClick: () {
                                  Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      pageBuilder: (context, animation,
                                              secondaryAnimation) =>
                                          LoginWidget(),
                                      transitionsBuilder: (context, animation,
                                          secondaryAnimation, child) {
                                        const begin = Offset(
                                            1.0, 0.0); // Start from the right
                                        const end =
                                            Offset.zero; // End at the center
                                        const curve = Curves.easeInOut;

                                        var tween = Tween(
                                                begin: begin, end: end)
                                            .chain(CurveTween(curve: curve));
                                        return SlideTransition(
                                          position: animation.drive(tween),
                                          child: child,
                                        );
                                      },
                                    ),
                                  );
                                },
                              )
                            ],
                          ),
                          SizedBox(height: 50),
                          // Adds some space at the bottom of the screen
                        ],
                      ),
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
