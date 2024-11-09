import 'dart:async';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:medforall/pages/tutorial.dart';
import 'generated/l10n.dart';
import 'registration.dart';
import 'login.dart';
import 'package:medforall/pages/controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LanguageCubit(),
      child: BlocBuilder<LanguageCubit, Locale>(
        builder: (context, locale) {
          return MaterialApp(
            locale: locale,
            supportedLocales: S.delegate.supportedLocales, // Keep only one supportedLocales definition
            localizationsDelegates: [
              S.delegate, // Ensure this import path is correct
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            localeResolutionCallback: (locale, supportedLocales) {
              if (locale != null) {
                for (var supportedLocale in supportedLocales) {
                  if (supportedLocale.languageCode == locale.languageCode) {
                    return supportedLocale;
                  }
                }
              }
              return supportedLocales.first; // Default fallback
            },
            home: MyHomePage(),
          );
        },
      ),
    );
  }
}

class LanguageCubit extends Cubit<Locale> {
  LanguageCubit() : super(const Locale('en', 'US')); // Default language is English

  void switchToArabic() {
    emit(const Locale('ar', 'AE'));
  }

  void switchToEnglish() {
    emit(const Locale('en', 'US'));
  }
}


class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              children: <Widget>[
                Component2Widget(),
                Positioned(
                  top: constraints.maxHeight * 0.03,
                  left: constraints.maxWidth * 0.03,
                  right: constraints.maxWidth * 0.03,
                  child: ImageSliderWidget(),
                ),
                Positioned(
                  top: constraints.maxHeight * 0.60,
                  left: constraints.maxWidth * 0.03,
                  right: constraints.maxWidth * 0.03,
                  child: BoxWidget(),
                ),
                Positioned(
                  top: constraints.maxHeight * 0.57,
                  left: constraints.maxWidth * 0.40,
                  child: LogoWidget(),
                ),
                Positioned(
                  top: constraints.maxHeight * 0.69,
                  left: constraints.maxWidth * 0.31,
                  child: AppNameWidget(),
                ),
                Positioned(
                  top: constraints.maxHeight * 0.74,
                  left: constraints.maxWidth * 0.03,
                  right: constraints.maxWidth * 0.03,
                  child: CommentWidget(),
                ),
                Positioned(
                  top: constraints.maxHeight * 0.80,
                  left: constraints.maxWidth * 0.17,
                  child: GetStartedWidget(),
                ),
                Positioned(
                  top: constraints.maxHeight * 0.85,
                  left: constraints.maxWidth * 0.19,
                  child: NamesmallWidget(),
                ),
              ],
            );
          },
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
        color: Color.fromRGBO(62, 156, 143, 1.0),
      ),
    );
  }
}


class ImageSliderWidget extends StatefulWidget {
  @override
  _ImageSliderWidgetState createState() => _ImageSliderWidgetState();
}

class _ImageSliderWidgetState extends State<ImageSliderWidget> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  late Timer _timer;

  final List<String> _images = [
    'assets/images/3.png',
    'assets/images/4.png',
    'assets/images/5.png',
    'assets/images/6.png',
  ];

  @override
  void initState() {
    super.initState();
    _startAutoSlide();
  }

  void _startAutoSlide() {
    _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (_currentPage < _images.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      width: MediaQuery.of(context).size.width * 0.35,
      child: PageView.builder(
        controller: _pageController,
        itemCount: _images.length,
        itemBuilder: (context, index) {
          return Image.asset(
            _images[index],
          );
        },
      ),
    );
  }
}

class BoxWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.95,
      height: MediaQuery.of(context).size.height * 0.35,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Color.fromRGBO(255, 255, 255, 1),
      ),
    );
  }
}

class LogoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.2,
      height: MediaQuery.of(context).size.height * 0.15,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/img_1.png'),
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}

class AppNameWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      'MED SHARE',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Color.fromRGBO(49, 49, 49, 1),
        fontFamily: 'Montserrat',
        fontSize: MediaQuery.of(context).size.width * 0.06,
        fontWeight: FontWeight.bold,
        height: 1,
      ),
    );
  }
}

class CommentWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      'Become a member of MedShare community.\nSave a life, today.',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Color.fromRGBO(55, 55, 55, 1),
        fontSize: MediaQuery.of(context).size.width * 0.04,
        fontWeight: FontWeight.normal,
        height: 1,
      ),
    );
  }
}

class GetStartedWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                RegistrationWidget(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
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
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color.fromRGBO(62, 156, 143, 1.0),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.2,
          vertical: MediaQuery.of(context).size.height * 0.008,
        ),
        child: Text(
          'Get Started',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color.fromRGBO(255, 255, 255, 1),
            fontFamily: 'Montserrat',
            fontSize: MediaQuery.of(context).size.width * 0.045,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }
}

class NamesmallWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      height: MediaQuery.of(context).size.height * 0.06,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: MediaQuery.of(context).size.height * 0.015,
            left: MediaQuery.of(context).size.width * 0.03,
            child: Text.rich(
              TextSpan(
                text: 'Already have an account? ',
                style: TextStyle(
                  color: Color.fromRGBO(113, 113, 113, 1),
                  fontFamily: 'Montserrat',
                  fontSize: MediaQuery.of(context).size.width * 0.035,
                  fontWeight: FontWeight.normal,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Login in.',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (context, animation, secondaryAnimation) => LoginWidget(),
                            transitionsBuilder: (context, animation, secondaryAnimation, child) {
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
                  ),
                ],
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }
}
