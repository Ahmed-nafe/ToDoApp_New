import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todonew/Pages/index_tasks/IndexScreen.dart';
import 'package:todonew/Pages/splash_screen/splashScreen.dart';
import 'package:todonew/pages/calender_page/screens/CalenderScreen.dart';
import 'package:todonew/pages/calender_page/screens/cubits/todos_cuibt_cubit.dart';
import 'package:todonew/pages/focuse_page/Focuse.dart';
import 'package:todonew/pages/home/HomeScreen.dart';
import 'package:todonew/pages/profile_page/ProfileScreen.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodosCuibt(),
      child: MaterialApp(
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
      ),
    );
  }
}
