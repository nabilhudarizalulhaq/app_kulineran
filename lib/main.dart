import 'package:apps_kulineran/blocs/auth/auth_bloc.dart';
import 'package:apps_kulineran/views/features/forgot_password.dart';
import 'package:apps_kulineran/views/features/home.dart';
import 'package:apps_kulineran/views/features/login_register.dart';
import 'package:apps_kulineran/views/features/onboarding.dart';
import 'package:apps_kulineran/views/features/spalsh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => AuthBloc(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kulineran',
      routes: {
        '/': (context) => const Splash(),
        '/onboarding': (context) => const Onboarding(),
        '/login': (context) => const LoginAndRegister(),
        '/forgotpassword': (context) => const ForgotPassword(),
        '/home': (context) => const HomePage(),
      },
    );
  }
}
