import 'package:apps_kulineran/views/features/widget/custom_filled_button.dart';
import 'package:apps_kulineran/views/features/widget/custom_item_profile.dart';
import 'package:apps_kulineran/views/globals/theme.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 22,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'My Profile',
                  style: blackTextStyle.copyWith(
                    fontSize: 38,
                    fontWeight: semiBold,
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    Text(
                      'Personal details',
                      style: blackTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: semiBold,
                      ),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'change',
                        style: greenTextStyle.copyWith(
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(22),
                      ),
                      child: Image.asset(
                        'assets/images/img/piring_.png',
                      ),
                    ),
                    const SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Marvis Ighedosa',
                          style: blackTextStyle.copyWith(
                            fontSize: 18,
                            fontWeight: semiBold,
                          ),
                        ),
                        Text(
                          'Dosamarvis@gmail.com',
                          style: greyTextStyle.copyWith(
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          '+234 9011039271',
                          style: greyTextStyle.copyWith(
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          'jalan raya leeriya,\nkampung arab ',
                          style: greyTextStyle.copyWith(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Column(
                  children: [
                    CustomItemProfile(
                      title: 'Orders',
                      onPressed: () {},
                    ),
                    const SizedBox(
                      height: 27,
                    ),
                    CustomItemProfile(
                      title: 'Pending reviews',
                      onPressed: () {},
                    ),
                    const SizedBox(
                      height: 27,
                    ),
                    CustomItemProfile(
                      title: 'Faq',
                      onPressed: () {},
                    ),
                    const SizedBox(
                      height: 27,
                    ),
                    CustomItemProfile(
                      title: 'Help',
                      onPressed: () {},
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    CustomButtonGreen(
                      title: 'Back',
                      width: double.infinity,
                      height: 50,
                    ),
                    const SizedBox(
                      height: 20,
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
