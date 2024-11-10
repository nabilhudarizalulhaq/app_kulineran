import 'package:apps_kulineran/blocs/login/bloc/login_blog_bloc.dart';
import 'package:apps_kulineran/data/services/login_service.dart';
import 'package:apps_kulineran/views/features/forgot_password.dart';
import 'package:apps_kulineran/views/features/home.dart';
import 'package:apps_kulineran/views/features/login_register.dart';
import 'package:apps_kulineran/views/features/onboarding.dart';
import 'package:apps_kulineran/views/features/spalsh.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<LoginService>(create: (_) => LoginService()), // Provide LoginService
        Provider<LoginBloc>(
          create: (context) => LoginBloc(loginService: Provider.of<LoginService>(context, listen: false)), // Pass LoginService to LoginBloc
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          // Add your app theme here
        ),
        routes: {
          '/': (context) => const Splash(),
          '/onboarding': (context) => const Onboarding(),
          '/login': (context) => const LoginAndRegister(),
          '/forgotpassword': (context) => const ForgotPassword(),
          '/home': (context) => const HomePage(),
        },
      ),
    );
  }
}


