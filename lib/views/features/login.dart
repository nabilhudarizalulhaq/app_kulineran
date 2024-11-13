import 'package:apps_kulineran/views/features/forgot_password.dart';
import 'package:apps_kulineran/views/features/widget/custom_form_field.dart';
import 'package:apps_kulineran/views/features/widget/custom_pasword_filedf_form.dart';
import 'package:apps_kulineran/views/features/widget/custom_text_button.dart';
import 'package:apps_kulineran/views/globals/theme.dart';
import 'package:flutter/material.dart';

class LoginTabPage extends StatelessWidget {
  const LoginTabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: ListView(
            children: [
              Column(
                children: [
                  CustomFormField(
                    title: 'Email',
                    controller: TextEditingController(),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 5),
                  CustomPasswordFormField(
                    title: 'Password',
                    controller: TextEditingController(),
                  ),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: CustomTextButton(
                      title: "Forgot passcode?",
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ForgotPassword()),
                          (route) => false,
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 130),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      alignment: Alignment.center,
                      height: 70,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(26),
                      ),
                      child: Text(
                        'Login',
                        style: blackTextStyle.copyWith(
                          fontSize: 22,
                          fontWeight: bold,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
