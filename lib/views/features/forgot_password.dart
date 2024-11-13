import 'package:apps_kulineran/views/features/login_register.dart';
import 'package:apps_kulineran/views/features/widget/custom_form_field.dart';
import 'package:apps_kulineran/views/globals/theme.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(22),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(26),
                ),
                child: Image.asset('assets/images/img/logo_g_.png'),
              ),
              const SizedBox(
                height: 50,
              ),
              CustomFormField(title: 'Password lama'),
              const SizedBox(
                height: 10,
              ),
              CustomFormField(title: 'Password baru'),
              const SizedBox(
                height: 10,
              ),
              CustomFormField(title: 'Konfirmasi Password'),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 50,
              ),
              GestureDetector(
                onTap: (){
                  Navigator.pushAndRemoveUntil(
                context, MaterialPageRoute(builder: (context) => const LoginAndRegister()),
                (route) => false,
              );
                },
                child: Container(
                alignment: Alignment.center,
                height: 70,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(26),
                ),
                child: Text(
                  'Ganti Password',
                  style: blackTextStyle.copyWith(
                    fontSize: 22,
                    fontWeight: bold,
                  ),
                ),
              ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}