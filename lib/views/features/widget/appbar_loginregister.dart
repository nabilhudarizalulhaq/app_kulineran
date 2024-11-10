import 'package:flutter/material.dart';

class AppbarLoginregister extends StatefulWidget {
  const AppbarLoginregister({super.key});

  @override
  State<AppbarLoginregister> createState() => _AppbarLoginregisterState();
}

class _AppbarLoginregisterState extends State<AppbarLoginregister> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 22,
        horizontal: 22,),
        child: Column(
          
          children: [
            // Container(
            //   height: 100,
            //   width: 100,
            //   decoration: BoxDecoration(
            //     color: Colors.black,
            //     borderRadius: BorderRadius.circular(22),
            //   ),
            //   child: Image.asset('assets/images/img/logo.png'),
            // ),
            // const SizedBox(height: 50),
            TabBar(
              controller: _tabController,
              indicatorColor: Colors.black,
              indicatorWeight: 4,
              tabs: const [
                Tab(
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    'Register',
                    style: TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
