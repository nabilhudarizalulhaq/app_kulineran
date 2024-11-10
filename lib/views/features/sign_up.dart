import 'package:apps_kulineran/views/features/widget/custom_form_field.dart';
import 'package:apps_kulineran/views/features/widget/custom_pasword_filedf_form.dart';
import 'package:apps_kulineran/views/globals/theme.dart';
import 'package:flutter/material.dart';

class SignUpTabPage extends StatelessWidget {
  const SignUpTabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          children: [
            const CustomFormField(
              title: 'username',
            ),
            const SizedBox(
              height: 5,
            ),
            const CustomFormField(
              title: 'Telpon',
            ),
            const SizedBox(
              height: 5,
            ),
            const CustomFormField(
              title: 'email',
            ),
            const SizedBox(
              height: 5,
            ),
            const CustomPasswordFormField(
              title: 'password',
            ),
            const SizedBox(
              height: 10,
            ),

            // Left-aligned CustomTextButton
            // const Align(
            //   alignment: Alignment.centerLeft,
            //   child: CustomTextButton(
            //     title: "Forgot passcode?",
            //   ),
            // ),
            const SizedBox(height: 32),

            // Centered Login button
            Container(
              alignment: Alignment.center,
              height: 70,
              width: double.infinity,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(26),
              ),
              child: Text(
                'Register',
                style: blackTextStyle.copyWith(
                  fontSize: 22,
                  fontWeight: bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
