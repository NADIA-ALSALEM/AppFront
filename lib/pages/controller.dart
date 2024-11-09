import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medforall/pages/donations.dart';
import 'package:medforall/pages/faq.dart';
import 'package:medforall/pages/personal_pharmacy.dart';
import 'package:medforall/pages/registration.dart';
import 'package:medforall/pages/settings.dart';
import 'package:medforall/pages/shortages.dart';
import 'package:medforall/pages/tutorial.dart';
import 'package:medforall/widgets/setting_section.dart';
import 'map_screen.dart'; // Import the MapScreen

class Controller extends StatelessWidget {
  const Controller({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        actions: [
          const Spacer(flex: 1),
          Image.asset('assets/images/img_1.png'),
          const Spacer(flex: 1),
          Text(
            'MED SHARE',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: const Color(0xff3E9C8F),
              fontSize: screenHeight * 0.025,
            ),
          ),
          const Spacer(flex: 50),
        ],
      ),
      body: ListView(
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
            child: Image.asset(
              'assets/images/dashboard.png',
              width: screenWidth * 0.80,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const SizedBox(width: 5),
              SettingSection(
                isShareIon: false,
                image: 'assets/images/settings.svg',
                title: Intl.message('Settings'),
                centered: true,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Settings()),
                  );
                },
              ),
              const SizedBox(width: 5),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              const SizedBox(width: 5),
              SettingSection(
                isShareIon: false,
                image: 'assets/images/personalPharmacy.svg',
                title: Intl.message('Personal Pharmacy'),
                centered: false,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PersonalPharmacy(
                        showBaseTitle: true,
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(width: 5),
              SettingSection(
                isShareIon: false,
                image: 'assets/images/registerMedicine.svg',
                title: Intl.message('Register Medicine'),
                centered: false,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Registration(),
                    ),
                  );
                },
              ),
              const SizedBox(width: 5),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              const SizedBox(width: 5),
              SettingSection(
                isShareIon: false,
                image: 'assets/images/donationPoints.svg',
                title: Intl.message('Donation Points'),
                centered: false,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MapScreen()),
                  );
                },
              ),
              const SizedBox(width: 5),
              SettingSection(
                isShareIon: false,
                image: 'assets/images/shortages.svg',
                title: Intl.message('Shortages'),
                centered: false,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Shortages()),
                  );
                },
              ),
              const SizedBox(width: 5),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              const SizedBox(width: 5),
              SettingSection(
                isShareIon: false,
                image: 'assets/images/FAQ.svg',
                title: Intl.message('F.A.Q'),
                centered: false,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Faq()),
                  );
                },
              ),
              const SizedBox(width: 5),
              SettingSection(
                isShareIon: false,
                image: 'assets/images/tutorial.svg',
                title: Intl.message('Tutorial'),
                centered: false,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Tutorial()),
                  );
                },
              ),
              const SizedBox(width: 5),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              const SizedBox(width: 5),
              SettingSection(
                isShareIon: true,
                image: '',
                title: Intl.message('Donation'),
                centered: true,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DonationsPage(
                        showBaseTitle: true,
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(width: 5),
            ],
          ),
        ],
      ),
    );
  }
}
