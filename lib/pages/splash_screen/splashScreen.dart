import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todonew/pages/home/HomeScreen.dart';


class SplashScreen extends StatelessWidget {
  static String routeName = "splash";
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, Homescreen.routeName);
    });
    return Scaffold(
 backgroundColor: Colors.black,
      body: Center(
        child: SvgPicture.asset("assets/splashScreen/Group 173.svg")
      ),
    );
  }
}