import 'package:flutter/material.dart';
import 'package:todonew/Pages/CalenderPage/CalenderScreen.dart';
import 'package:todonew/Pages/FocusePage/Focuse.dart';
import 'package:todonew/Pages/HomeScreen.dart';
import 'package:todonew/Pages/IndexTasks/IndexScreen.dart';
import 'package:todonew/Pages/ProfilePage/ProfileScreen.dart';
import 'package:todonew/Pages/SplashScreen/splashScreen.dart';

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
