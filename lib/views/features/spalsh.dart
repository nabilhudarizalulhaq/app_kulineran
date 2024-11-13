import 'package:apps_kulineran/blocs/auth/auth_bloc.dart';
import 'package:apps_kulineran/blocs/auth/auth_event.dart';
import 'package:apps_kulineran/blocs/auth/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    context.read<AuthBloc>().add(CheckAuthEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthAuthenticated) {
          Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
        } else if (state is AuthUnauthenticated) {
          Navigator.pushNamedAndRemoveUntil(context, '/onboarding', (route) => false);
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/img/logo_g_.png"),
                  ),
                ),
                child: Image.asset(
                  "assets/images/img/logo_g_.png",
                  width: 160,
                  height: 160,
                ),
              ),
              const SizedBox(height: 3),
              const Text(
                "KULINERAN",
                style: TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// import 'dart:async';

// import 'package:flutter/material.dart';

// class Splash extends StatefulWidget {
//   const Splash({super.key});

//   @override
//   State<Splash> createState() => _SplashState();
// }

// class _SplashState extends State<Splash> {
//   @override
//   void initState() {
//     super.initState();
//     Timer(const Duration(seconds: 2), () {
//       Navigator.pushNamedAndRemoveUntil(
//           context, '/onboarding', (route) => false);
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Container(
//               decoration: const BoxDecoration(
//                 image: DecorationImage(
//                   image: AssetImage(
//                     "assets/images/img/logo_g_.png",

//                   ),
//                 ),
//               ),
//               child: Image.asset(
//                 "assets/images/img/logo_g_.png",
//                 width: 160,
//                 height: 160,
//               ),
//               // child: const RotatingImage(),
//             ),
//             const SizedBox(
//               height: 3,
//             ),
//             const Text(
//               "KULINERAN",
//               style: TextStyle(
//                 fontSize: 45,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
