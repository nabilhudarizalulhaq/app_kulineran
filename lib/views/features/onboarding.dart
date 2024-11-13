import 'package:apps_kulineran/views/features/widget/custom_bottom_bar.dart';
import 'package:apps_kulineran/views/features/widget/custom_filled_button.dart';
import 'package:apps_kulineran/views/globals/theme.dart';
import 'package:flutter/material.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SingleChildScrollView(
        padding: EdgeInsets.zero,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(
                top: 80,
                bottom: 0,
              ),
              height: 200,
              width: 200,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/images/img/logo_g.png",
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                left: 35,
              ),
              child: Text(
                "Food for \nEveryone",
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.w900,
                  color: Color(0xffFFFFFF),
                  letterSpacing: 0,
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              height: 450,
              width: 430,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/images/img/banner.png",
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            CustomGreenButton(
              title: 'Get Started',
              width: double.infinity,
              height: 60,
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CustomBottomBar()),
                  (route) => false,
                );
              },
            ),
            SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}