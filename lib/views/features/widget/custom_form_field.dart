import 'package:apps_kulineran/views/globals/theme.dart';
import 'package:apps_kulineran/data/services/login_service.dart';
import 'package:flutter/material.dart';

class CustomFormField extends StatefulWidget {
  final String title;
  final bool obscureText;
  final TextEditingController? controller;
  final bool isShowTitle;
  final TextInputType? keyboardType;

  const CustomFormField({
    super.key,
    required this.title,
    this.obscureText = false,
    this.controller,
    this.isShowTitle = true,
    this.keyboardType,
  });

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final LoginService loginService = LoginService();

  void handleLogin() async {
    final email = emailController.text;
    final password = passwordController.text;

    final user = await loginService.login(email, password);

    if (user != null) {
      print("Login successful. Token: ${user.token}");
      // Navigate to the next screen or store the token as needed
    } else {
      print("Login failed");
      // Show an error message to the user
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.isShowTitle) Text(
          widget.title,
          style: greyTextStyle.copyWith(
            fontWeight: semiBold,
          ),
        ),
        if (widget.isShowTitle)
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          obscureText: widget.obscureText,
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          decoration: InputDecoration(
            hintText: !widget.isShowTitle ? widget.title : null,
            contentPadding: const EdgeInsets.all(16),
          ),
        ),
      ],
    );
  }
}