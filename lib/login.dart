import 'dart:async';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:medforall/styles/gray_text_style.dart';
import 'dart:math' as math;
import 'component/LogoWidget.dart';
import 'component/buttons/dark_text_style.dart';
import 'component/buttons/main_button.dart';
import 'component/buttons/text_button.dart';
import 'component/gender_widget.dart';
import 'component/text_input.dart';
import 'component/title_widget.dart';
import 'registration.dart';
import 'colors.dart';
import 'pages/controller.dart';

class LoginWidget extends StatefulWidget {
  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Stack(
                children: <Widget>[
                  Component2Widget(),
                  Positioned(
                    top: -100,
                    left: -145,
                    child: Ellipse4Widget(),
                  ),
                  SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(child: LogoWidget()),
                        Center(
                          child: TitleWidget(
                            title: "Login",
                          ),
                        ),
                        TextInput(
                          hintText: "Enter your email",
                          inputType: TextInputType.emailAddress,
                          controller: emailController,
                          labelText: "email",
                        ),
                        TextInput(
                          hintText: "Your password",
                          inputType: TextInputType.visiblePassword,
                          controller: passwordController,
                          labelText: "Password",
                          obscureText: true,
                        ),
                        MainButton(
                          text: "Sign in",
                          onClick: () {
                            String email = emailController.text;
                            String password = passwordController.text;
                            print("Email: $email");
                            print("Password: $password");

                            // Navigate to ControllerPage
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Controller(),
                              ),
                            );
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an account?",
                              style: grayText,
                            ),
                            CostumeTextButton(
                              text: "Sign up",
                              style: darkText,
                              onClick: () {
                                Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder: (context, animation,
                                        secondaryAnimation) =>
                                        RegistrationWidget(),
                                    transitionsBuilder: (context, animation,
                                        secondaryAnimation, child) {
                                      const begin = Offset(1.0, 0.0);
                                      const end = Offset.zero;
                                      const curve = Curves.easeInOut;

                                      var tween = Tween(begin: begin, end: end)
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
                        )
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}


class Component2Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
      ),
    );
  }
}


class Ellipse4Widget extends StatefulWidget {
  @override
  _Ellipse4WidgetState createState() => _Ellipse4WidgetState();
}

class _Ellipse4WidgetState extends State<Ellipse4Widget> {
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: 48.99999955470795 * (math.pi / 180),
      child: Container(
          width: 250,
          height: 250,
          decoration: BoxDecoration(
            color:
                  AppColors.primaryColor,
            borderRadius: BorderRadius.all(Radius.elliptical(150, 150)),
          )),
    );
  }
}
class InputEmailWidget extends StatefulWidget {
  @override
  _InputEmailWidgetState createState() => _InputEmailWidgetState();
}

class _InputEmailWidgetState extends State<InputEmailWidget> {
  // Controller for text input
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 90,
      child: Stack(
        children: <Widget>[
          // Input container with shadow and rounded corners
          Positioned(
            top: 20,
            left: 5,
            child: Container(
              width: 310,
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
              // Input field
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: 'example@gmail.com',
                  hintStyle: TextStyle(
                    color: Color.fromRGBO(127, 127, 127, 1),
                    fontFamily: 'Montserrat',
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    height: 1,
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(left: 16, bottom: 12), // Adjusted bottom padding
                ),
              ),
            ),
          ),
          // Header label "Email" at the top
          Positioned(
            top: 4,
            left: 17,
            child: Container(
              decoration: BoxDecoration(

                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(7),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.25),
                    offset: Offset(0, 1),
                    blurRadius: 2,
                  ),
                ],
              ),
              padding: EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              child: Text(
                'Email',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Montserrat',
                  fontSize: 13,
                  fontWeight: FontWeight.normal,
                  height: 1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}



class PasswordWidget extends StatefulWidget {
  @override
  _PasswordWidgetState createState() => _PasswordWidgetState();
}

class _PasswordWidgetState extends State<PasswordWidget> {
  // Controller for password input
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 90,
      child: Stack(
        children: <Widget>[
          // Input container with shadow and rounded corners
          Positioned(
            top: 20,
            left: 5,
            child: Container(
              width: 310,
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
              // Input field for password
              child: TextField(
                controller: _controller,
                obscureText: true, // Hide the input
                decoration: InputDecoration(
                  hintText: 'Your Password',
                  hintStyle: TextStyle(
                    color: Color.fromRGBO(127, 127, 127, 1),
                    fontFamily: 'Montserrat',
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    height: 1,
                  ),
                  border: InputBorder.none,
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
                    color: AppColors.shadowColor,
                    offset: Offset(0, 1),
                    blurRadius: 2,
                  )
                ],
                  color:
                  AppColors.primaryColor
                ),
              padding: EdgeInsets.symmetric(horizontal: 11, vertical: 6),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    'Password',
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

class SignButtonWidget extends StatefulWidget {
  @override
  _SignButtonWidgetState createState() => _SignButtonWidgetState();
}

class _SignButtonWidgetState extends State<SignButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("Sign in button pressed");
      },
      child: Container(
        width: 150, // Adjusted width for a more button-like appearance
        height: 50,
        decoration: BoxDecoration(
          color: AppColors.primaryColor, // Color is defined first
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
            'Login',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white, // Text color for better contrast
              fontFamily: 'Montserrat',
              fontSize: 16,
              fontWeight: FontWeight.bold,
              height: 1,
            ),
          ),
        ),
      ),
    );
  }
}


class ToSignUpWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      height: MediaQuery.of(context).size.height * 0.06,
      child: Stack(
        children: <Widget>[
          Positioned(
            child: Text.rich(
              TextSpan(
                text: 'Don\'t have an account? ',
                style: TextStyle(
                  color: Color.fromRGBO(113, 113, 113, 1),
                  fontFamily: 'Montserrat',
                  fontSize: MediaQuery.of(context).size.width * 0.035,
                  fontWeight: FontWeight.normal,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Sign up.',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) =>
                                    RegistrationWidget(),
                            transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
                              const begin =
                                  Offset(3.0, 0.0); // Start from the right
                              const end = Offset.zero; // End at the center
                              const curve = Curves.easeInOut;

                              var tween = Tween(begin: begin, end: end)
                                  .chain(CurveTween(curve: curve));
                              return SlideTransition(
                                position: animation.drive(tween),
                                child: child,
                              );
                            },
                          ),
                        );
                      },
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
