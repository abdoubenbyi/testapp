import 'package:flutter/material.dart';
import 'package:idna_food/screens/assign_screen/assign_screen.dart';
import 'package:idna_food/widgets/custom_text.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 40),
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 190,
                    width: 190,
                    padding: EdgeInsets.all(30),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(17),
                      border: Border.all(
                        color: Color.fromRGBO(237, 237, 237, 1),
                      ),
                    ),
                    child: Image.asset('assets/idna_logo.png'),
                  ),
                  const SizedBox(height: 40),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(29, 85, 74, 1),
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(
                        vertical: 25,
                        horizontal: 70,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AssignScreen(),
                        ),
                      );
                    },
                    child: CustomText(
                      text: 'Connection',
                      color: Colors.white,
                      weight: FontWeight.w600,
                      size: 16,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              child: Image.asset('assets/agri_logo.png', height: 100),
            ),
          ],
        ),
      ),
    );
  }
}
