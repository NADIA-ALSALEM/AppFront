import 'package:flutter/material.dart';
import 'package:medforall/generated/l10n.dart';
import 'package:medforall/tabs/completed.dart';
import 'package:medforall/tabs/scheduled.dart';

class DonationsPage extends StatelessWidget {
  const DonationsPage({
    super.key,
    required this.showBaseTitle,
  });
  final bool showBaseTitle;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: showBaseTitle
              ? Text(
            'Donations',  // Hardcoded text for the title
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: screenHeight * 0.025,
            ),
          )
              : Text(
            S.of(context).step3,
            style: TextStyle(
              color: const Color(0xff3E9C8F),
              fontSize: screenHeight * 0.025,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: !showBaseTitle,
          backgroundColor: showBaseTitle ? const Color(0xff3E9C8F) : Colors.white,
          surfaceTintColor: showBaseTitle ? const Color(0xff3E9C8F) : Colors.white,
          leading: showBaseTitle
              ? IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
            ),
          )
              : const SizedBox(),
        ),
        body: Column(
          children: [
            Container(
              color: showBaseTitle ? const Color(0xff3E9C8F) : Colors.white,
              child: TabBar(
                indicatorColor: showBaseTitle ? Colors.white : const Color(0xff3E9C8F),
                labelColor: showBaseTitle ? Colors.white : const Color(0xff3E9C8F),
                unselectedLabelColor: showBaseTitle ? Colors.white : const Color(0xff3E9C8F),
                tabs: [
                  Tab(
                    icon: Text(S.of(context).scheduled),
                  ),
                  Tab(
                    icon: Text(S.of(context).completed),
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Scheduled(),
                  Completed(),
                ],
              ),
            ),
          ],
        ),

      ),
    );
  }
}
