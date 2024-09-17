import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:todonew/AddTaskBottomSheet.dart';
import 'package:todonew/Pages/CalenderPage/CalenderScreen.dart';
import 'package:todonew/Pages/CalenderPage/TodosModel.dart';
import 'package:todonew/Pages/FocusePage/Focuse.dart';
import 'package:todonew/Pages/IndexTasks/IndexScreen.dart';
import 'package:todonew/Pages/ProfilePage/ProfileScreen.dart';

class Homescreen extends StatefulWidget {
  static const String routeName = 'Home';

  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  List<TodoItemModel> todos = [];
  TextEditingController _dateTimeController = TextEditingController();
  int currentIndex = 0;
  TextEditingController titlecontroller = TextEditingController();
  TextEditingController descontroller = TextEditingController();
  var formkey = GlobalKey<FormState>();
  List<Widget> Tab = [
    IndexScreen(),
    CalenderScreen(),
    // AddTaskBottomSheet(),
    FocuseTab(),
    ProfileTab()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(canvasColor: Color(0xff363636)),
        child: BottomNavigationBar(
          // fixedColor: Colors.red,
          //   selectedItemColor: Colors.blue,
          //   unselectedItemColor: Colors.white54,
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            unselectedIconTheme: IconThemeData(size: 50,color: Colors.grey),
            selectedIconTheme: IconThemeData(size: 24,color: Colors.yellow),
            currentIndex: currentIndex,
            // fixedColor: Color(0xff242424),
            iconSize: 60,
            showUnselectedLabels: true,
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            items: [
              // BottomNavigationBarItem(
              //   icon: Icon(Icons.home),
              //   label: 'Index',
              // ),
              // BottomNavigationBarItem(
              //   icon: Icon(Icons.calendar_today),
              //   label: 'Calendar',
              // ),
              // BottomNavigationBarItem(
              //   icon: FloatingActionButton(
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(30.0),
              //     ),
              //     backgroundColor: const Color(0xff8687E7),
              //     onPressed: () {
              //       showModalBottomSheet(
              //           isScrollControlled: true,
              //           backgroundColor: Color(0xff363636),
              //           context: context,
              //           builder: (context) {
              //             return AddTaskBottomSheet();
              //           });
              //     },
              //     child: const Icon(Icons.add, color: Colors.white70),
              //   ),
              //   label: '',
              // ),
              // BottomNavigationBarItem(
              //   icon: Icon(Icons.alarm),
              //   label: 'Focus',
              // ),
              // BottomNavigationBarItem(
              //   icon: Icon(Icons.person),
              //   label: 'Profile',
              // ),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    "assets/Icons/home-2.svg",
                  ),
                  label: 'index'),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset("assets/Icons/calendar.svg"),
                  label: 'Calendar'),
              // BottomNavigationBarItem(
              //   icon: FloatingActionButton(
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(30.0),
              //     ),
              //     backgroundColor: const Color(0xff8687E7),
              //     onPressed: () {
              //       showModalBottomSheet(
              //           isScrollControlled: true,
              //           backgroundColor: Color(0xff363636),
              //           context: context,
              //           builder: (context) {
              //             return AddTaskBottomSheet();
              //           });
              //     },
              //     child: const Icon(Icons.add, color: Colors.white70),
              //   ),
              //   label: '',
              // ),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset("assets/Icons/clock.svg"),
                  label: 'Focuse'),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset("assets/Icons/user.svg"),
                  label: 'profile'),
            ]),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        backgroundColor: const Color(0xff8687E7),
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              backgroundColor: Color(0xff363636),
              context: context,
              builder: (context) {
                return AddTaskBottomSheet();
              });
        },
        child: const Icon(Icons.add, color: Colors.white70),
      ),
      body: Tab[currentIndex],
    );
    ;
  }
}
