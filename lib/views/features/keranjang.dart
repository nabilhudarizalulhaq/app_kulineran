import 'package:apps_kulineran/views/features/widget/custom_counter_button.dart';
import 'package:apps_kulineran/views/globals/theme.dart';
import 'package:flutter/material.dart';

class KeranjangPage extends StatelessWidget {
  const KeranjangPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightGray,
      appBar: AppBar(),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 22, vertical: 22),
        children: [
          Container(
            padding: EdgeInsets.all(16),
            height: 102,
            width: double.infinity,
            decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(22),
            ),
            child: Row(
              children: [
                Container(
                  height: 69,
                  width: 69,
                  decoration: BoxDecoration(
                    color: white,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    'assets/images/img/piring_.png',
                  ),
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Veggie tomato mix',
                      style: blackTextStyle.copyWith(
                        fontSize: 17,
                        fontWeight: semiBold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          'Rp. 13.000',
                          style: greenTextStyle.copyWith(
                            fontSize: 15,
                            fontWeight: semiBold,
                          ),
                        ),
                        SizedBox(width: 40),
                        CounterPage(),
                        
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
