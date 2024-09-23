import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todonew/core/themes/colors.dart';
import 'package:todonew/pages/calender_page/screens/CalenderTime.dart';
import 'package:todonew/pages/calender_page/screens/ShowListsTodo.dart';
import 'package:todonew/pages/calender_page/screens/list_todo_item.dart';

class CalenderScreen extends StatefulWidget {
  static const String routeName = "calenderScreen";

  const CalenderScreen({
    super.key,
  });

  @override
  State<CalenderScreen> createState() => _CalenderScreenState();
}

class _CalenderScreenState extends State<CalenderScreen> {
  int currentIndex = 0;

  // List<Widget> ListTask() {
  //   return [
  //     ListTodoItemToday(),
  //
  //   ];
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Calendar",
          style: GoogleFonts.lato(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.dark,
      ),
      backgroundColor: AppColors.dark,
      body: Column(
        children: [
          CalenderTime(),
          ShowListTodos(),
          ListTodoItemToday(),
        ],
      ),
    );
  }
}
