import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:permission_handler/permission_handler.dart';

class Registration extends StatelessWidget {
  const Registration({super.key});

  // Function to handle barcode scanning with permission check
  Future<void> scanVerticalCode(BuildContext context) async {
    // Request camera permission
    if (await Permission.camera.request().isGranted) {
      try {
        var result = await BarcodeScanner.scan();
        if (result.rawContent.isNotEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Scanned code: ${result.rawContent}')),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('No barcode detected')),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error occurred: $e')),
        );
      }
    } else {
      // Show a message if permission is denied
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Camera permission is required to scan the code')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

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
          'Registration',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: screenHeight * 0.025,
          ),
        ),
        backgroundColor: const Color(0xff3E9C8F),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: screenHeight * 0.02,
          horizontal: screenWidth * 0.05,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(flex: 2),
            Text(
              'Register your medicines!',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: screenHeight * 0.03,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              'Find the sticker on the medicine box. Scan or type the vertical code.',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: screenHeight * 0.02,
              ),
              textAlign: TextAlign.center,
            ),
            const Spacer(flex: 10),
            Image.asset(
              'assets/images/medicineScan.jpg',
              height: screenHeight * 0.35,
              width: screenWidth * 0.7,
              fit: BoxFit.contain,
            ),
            const Spacer(flex: 10),
            SizedBox(
              width: screenWidth * 0.90,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    const Color(0xff3E9C8F),
                  ),
                  padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(
                      vertical: screenHeight * 0.03,
                      horizontal: screenWidth * 0.05,
                    ),
                  ),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                onPressed: () {
                  scanVerticalCode(context);
                },
                child: Text(
                  'Scan the vertical code',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: screenHeight * 0.02,
                  ),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            SizedBox(
              width: screenWidth * 0.90,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    const Color(0xff3E9C8F),
                  ),
                  padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(
                      vertical: screenHeight * 0.03,
                      horizontal: screenWidth * 0.05,
                    ),
                  ),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                onPressed: () {
                  // Handle typing the code if needed
                },
                child: Text(
                  'Type the vertical code',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: screenHeight * 0.02,
                  ),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            GestureDetector(
              onTap: () {
                // Handle the case where there's no sticker
              },
              child: Text(
                'There isn\'t a sticker in the box',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.black,
                  decorationThickness: 1.0,
                  fontWeight: FontWeight.w500,
                  fontSize: screenHeight * 0.020,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Registration(),
  ));
}
