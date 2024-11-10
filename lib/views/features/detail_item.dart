import 'package:apps_kulineran/views/features/widget/custom_bottomseed.dart';
import 'package:apps_kulineran/views/features/widget/custom_navbar.dart';
import 'package:apps_kulineran/views/globals/theme.dart';
import 'package:flutter/material.dart';

class DetailItem extends StatelessWidget {
  const DetailItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomNavbar(),
      body: ListView(
        children: [
          Center(
            child: Column(
              children: [
                Container(
                  height: 241.21,
                  width: 241.21,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    shape: BoxShape.circle,
                  ),
                  // gambar makanan
                  child: Image.asset(
                    'assets/images/img/piring_.png',
                  ),
                ),
                const SizedBox(
                  height: 90,
                ),
                Text(
                  'Veggie tomato mix',
                  style: blackTextStyle.copyWith(
                    fontSize: 28,
                    fontWeight: semiBold,
                  ),
                ),
                Text(
                  'Rp. 50.000',
                  style: greenTextStyle.copyWith(
                    fontSize: 28,
                    fontWeight: bold,
                  ),
                ),
                const SizedBox(
                  height: 43,
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const BottomSeed(),
                ),
              );
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Location Info',
                    style: blackTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: bold,
                    ),
                  ),
                  Text(
                    'alamat',
                    style: greyTextStyle.copyWith(
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(
                    height: 150,
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            // route ke maps
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const BottomSeed(),
                ),
              );
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 22),
              child: Center(
                child: Container(
                  height: 70,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: white,
                    border: Border.all(
                      color: Colors.black,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: Center(
                    child: Text(
                      'Select',
                      style: greenTextStyle.copyWith(
                        fontSize: 22,
                        fontWeight: bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
