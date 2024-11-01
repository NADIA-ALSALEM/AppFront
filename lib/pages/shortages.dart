import 'package:flutter/material.dart';
import 'package:medforall/widgets/donated_medicine.dart';

class Shortages extends StatelessWidget {
  const Shortages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
          ),
        ),
        title: Text(
          'Community Effect',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: MediaQuery.of(context).size.height * 0.025,
          ),
        ),
        backgroundColor: const Color(0xff3E9C8F),
        surfaceTintColor: const Color(0xff3E9C8F),
      ),
      body: ListView(
        children: const [
          Center(
            child: Text(
              'Our community in numbers',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Center(
            child: Text(
              'Thank you for being part of it!',
              style: TextStyle(),
            ),
          ),
          SizedBox(height: 17),
          DonatedMedicine(
            image: 'assets/images/boxesOfMedicine.png',
            number: 566165,
            title: 'Boxes of Medicines Donated',
            subTitle:
                'Because of you, the medicines reached people that need them!',
            showDivider: false,
          ),
          DonatedMedicine(
            image: 'assets/images/saved.png',
            number: 7380809,
            title: 'We saved ',
            subTitle:
                'The institutions we co-optmith will cover with those (medicines) other need of the people they support!',
            showDivider: true,
          ),
          DonatedMedicine(
            image: 'assets/images/medicineRequests.png',
            number: 129556,
            title: 'Medicines Responsibly Disposed',
            subTitle:
                'By ensuring safe spoilage, you are helping create a cleaner, safe environment for all us!',
            showDivider: true,
          ),
          DonatedMedicine(
            image: 'assets/images/helped.png',
            number: 159,
            title: 'Donation Center',
            subTitle:
                'Our Partnerships with health centers mean your donation go further, supporting community health more effectively!',
            showDivider: true,
          ),
        ],
      ),
    );
  }
}
