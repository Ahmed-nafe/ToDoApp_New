import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todonew/Pages/CalenderPage/CalenderScreen.dart';
import 'package:todonew/Pages/FocusePage/Focuse.dart';

class IndexScreen extends StatefulWidget {
  static const String routeName = "index";

  const IndexScreen({super.key});

  @override
  State<IndexScreen> createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
    );
  }
}
