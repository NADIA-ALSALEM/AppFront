import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medforall/bloc/language_cubit.dart';
import 'package:medforall/generated/l10n.dart';
import 'package:medforall/pages/donations.dart';
import 'package:medforall/pages/personal_pharmacy.dart';
import 'package:medforall/widgets/tutorial_page_indicator.dart';

class Tutorial extends StatefulWidget {
  const Tutorial({super.key});

  @override
  State<Tutorial> createState() => _TutorialState();
}

class _TutorialState extends State<Tutorial> {
  int indexNumber = 0;
  final languageController = ValueNotifier<bool>(true);
  final PageController _pageController = PageController();

  @override
  void dispose() {
    languageController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    languageController.addListener(() {
      if (languageController.value) {
        context.read<LanguageCubit>().switchToArabic();
      } else {
        context.read<LanguageCubit>().switchToEnglish();
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Set initial state of language controller based on current locale
    languageController.value = Localizations.localeOf(context).languageCode == 'ar';
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    List<Widget> screens = [
      Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: const SizedBox(),
          actions: [
            const Spacer(flex: 20),
            AdvancedSwitch(
              controller: languageController,
              activeColor: const Color(0xff008000),
              inactiveColor: const Color(0xff1E90FF),
              activeChild: Text(S.of(context).lang),
              inactiveChild: Text(S.of(context).lang),
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              width: screenWidth * 0.26,
              height: screenHeight * 0.05,
              enabled: true,
              disabledOpacity: 0.5,
            ),
            const Spacer(flex: 1),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 5),
              Image.asset(
                'assets/images/img_1.png',
                width: screenWidth * 0.4,
              ),
              Text(
                'MED SHARE',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: const Color(0xff3E9C8F),
                  fontSize: screenWidth * 0.07,
                ),
              ),
              const Spacer(flex: 1),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                child: Text(
                  S.of(context).tutorial_title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: screenWidth * 0.040,
                  ),
                ),
              ),
              const Spacer(flex: 5),
            ],
          ),
        ),
      ),
      Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          leading: const SizedBox(),
          centerTitle: true,
          title: Text(
            S.of(context).step1,
            style: TextStyle(
              color: const Color(0xff3E9C8F),
              fontSize: screenHeight * 0.025,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/medicineScan.jpg',
                  height: screenHeight * 0.37,
                  width: screenWidth * 0.7,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 40),
                SizedBox(
                  width: screenWidth * 0.90,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff3E9C8F),
                      padding: EdgeInsets.symmetric(
                        vertical: screenHeight * 0.02,
                        horizontal: screenWidth * 0.05,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      S.of(context).scan_button_child,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenHeight * 0.02,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: screenWidth * 0.90,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff3E9C8F),
                      padding: EdgeInsets.symmetric(
                        vertical: screenHeight * 0.02,
                        horizontal: screenWidth * 0.05,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      S.of(context).type_button_child,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenHeight * 0.02,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                Container(
                  color: const Color.fromARGB(255, 202, 216, 214),
                  width: screenWidth,
                  height: 110,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        color: const Color(0xff3E9C8F),
                        width: screenWidth,
                        height: screenHeight * 0.01,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        S.of(context).register_medicines,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: screenWidth * 0.04,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.05,
                        ),
                        child: Text(
                          S.of(context).find_sticker,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: screenWidth * 0.04,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      const PersonalPharmacy(showBaseTitle: false),
      const DonationsPage(showBaseTitle: false),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            flex: 6,
            child: PageView.builder(
              controller: _pageController,
              itemCount: screens.length,
              onPageChanged: (index) {
                setState(() {
                  indexNumber = index;
                });
              },
              itemBuilder: (context, index) {
                return screens[index];
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Container(
                decoration: BoxDecoration(
                  color: indexNumber == 0
                      ? Colors.transparent
                      : const Color(0xff3E9C8F),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.13,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (indexNumber != 0)
                        IconButton(
                          onPressed: () {
                            _pageController.previousPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeIn,
                            );
                          },
                          icon: const Icon(Icons.arrow_back_ios_new),
                          iconSize: 30,
                          color: Colors.white,
                        ),
                      if (indexNumber != screens.length - 1)
                        IconButton(
                          onPressed: () {
                            _pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeIn,
                            );
                          },
                          icon: const Icon(Icons.arrow_forward_ios),
                          iconSize: 30,
                          color: Colors.white,
                        ),
                      if (indexNumber == screens.length - 1)
                        IconButton(
                          onPressed: () {
                            // Navigate to your final screen here
                          },
                          icon: const Icon(Icons.check),
                          iconSize: 30,
                          color: Colors.white,
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
