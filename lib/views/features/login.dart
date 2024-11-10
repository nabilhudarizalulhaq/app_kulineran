import 'package:apps_kulineran/blocs/login/bloc/login_blog_bloc.dart';
import 'package:apps_kulineran/blocs/login/bloc/login_blog_event.dart';
import 'package:apps_kulineran/blocs/login/bloc/login_blog_state.dart';
import 'package:apps_kulineran/data/services/login_service.dart';
import 'package:apps_kulineran/views/features/forgot_password.dart';
import 'package:apps_kulineran/views/features/widget/custom_form_field.dart';
import 'package:apps_kulineran/views/features/widget/custom_pasword_filedf_form.dart';
import 'package:apps_kulineran/views/features/widget/custom_text_button.dart';
import 'package:apps_kulineran/views/globals/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginTabPage extends StatelessWidget {
  const LoginTabPage({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return BlocProvider(
      create: (context) => LoginBloc(loginService: LoginService()),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: BlocListener<LoginBloc, LoginState>(
              listener: (context, state) {
                if (state is LoginSuccess) {
                  Navigator.pushReplacementNamed(context, '/home');
                } else if (state is LoginFailure) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.error)),
                  );
                }
              },
              child: ListView(
                children: [
                  Column(
                    children: [
                      CustomFormField(
                        title: 'Email',
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 5),
                      CustomPasswordFormField(
                        title: 'Password',
                        controller: passwordController,
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

                      // Centered Login button
                      GestureDetector(
                        onTap: () {
                          final email = emailController.text;
                          final password = passwordController.text;
                          context.read<LoginBloc>().add(
                                LoginButtonPressed(
                                    email: email, password: password),
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
        ),
      ),
    );
  }
}
