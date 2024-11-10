//
import 'package:apps_kulineran/views/globals/theme.dart';
import 'package:apps_kulineran/views/features/login.dart';
import 'package:apps_kulineran/views/features/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginAndRegister extends StatelessWidget {
  const LoginAndRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 50,
          ),
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
              SliverToBoxAdapter(
                child: _logo(context: context),
              ),
              SliverAppBar(
                pinned: true,
                elevation: 0,
                automaticallyImplyLeading: false,
                shape: Border(
                  bottom: BorderSide(
                    width: 3,
                    color: primaryColor,
                  ),
                ),
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(0),
                  child: tab(context: context),
                ),
              ),
            ],
            body: const TabBarView(
              children: [
                LoginTabPage(),
                SignUpTabPage(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

TabBar tab({required BuildContext context}) {
  return TabBar(
    unselectedLabelColor: gray,
    labelColor: black,
    indicatorColor: primaryColor,
    indicatorWeight: 3,
    tabs: [
      tabItem(context: context, label: "Login"),
      tabItem(context: context, label: "Sign-Up"),
    ],
  );
}

Tab tabItem({required BuildContext context, required String label}) {
  return Tab(
    child: Text(
      label,
      style: GoogleFonts.poppins(
        fontSize: 22,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}

Center _logo({required BuildContext context}) {
  return Center(
    child: Container(
      height: 150,
      width: 150,
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Image.asset('assets/images/img/logo_g_.png'),
    ),
  );
}
