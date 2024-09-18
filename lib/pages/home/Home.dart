import 'package:flutter/material.dart';
import 'package:todonew/Pages/calender_page/CalenderScreen.dart';
import 'package:todonew/Pages/HomeScreen.dart';
import 'package:todonew/Pages/index_tasks/IndexScreen.dart';
import 'package:todonew/Pages/splash_screen/splashScreen.dart';
import 'package:todonew/pages/focuse_page/Focuse.dart';
import 'package:todonew/pages/profile_page/ProfileScreen.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => SplashScreen(),
        Homescreen.routeName: (context) => Homescreen(),
        ProfileTab.routeName: (context) => ProfileTab(),
        IndexScreen.routeName: (_) => IndexScreen(),
        CalenderScreen.routeName: (_) => CalenderScreen(),
        FocuseTab.routeName: (context) => FocuseTab()
      },
    );
  }
}
