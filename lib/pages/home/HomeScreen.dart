import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todonew/core/themes/colors.dart';
import 'package:todonew/pages/calender_page/screens/CalenderScreen.dart';
import 'package:todonew/pages/focuse_page/Focuse.dart';
import 'package:todonew/pages/home/AddTaskBottomSheet.dart';
import 'package:todonew/pages/index_tasks/screens/IndexScreen.dart';
import 'package:todonew/pages/profile_page/ProfileScreen.dart';

class Homescreen extends StatefulWidget {
  static const String routeName = 'Home';

  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {

  int currentIndex = 0;

  List<Widget> Tab = [
    IndexScreen(),
    CalenderScreen(),
    FocuseTab(),
    ProfileTab()
  ];

  @override
  Widget build(BuildContext context) {
    double heightSize = MediaQuery.of(context).size.height;
    double widthSize = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: AppColors.primarygray,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          selectedIconTheme: IconThemeData(size: widthSize*0.9, ),
          unselectedIconTheme: IconThemeData(size:widthSize*0.9 , ),
          currentIndex: currentIndex,
          iconSize: 60,
          showUnselectedLabels: true,
          selectedItemColor: AppColors.white,
          unselectedItemColor: Colors.grey,

          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/Icons/home-2.svg",
                    color: currentIndex == 0 ? AppColors.white : Colors.grey),
                label: 'index'),
            BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/Icons/calendar.svg",
                    color: currentIndex == 1 ? AppColors.white : Colors.grey),
                label: 'Calendar'),
            BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/Icons/clock.svg",
                    color: currentIndex == 2 ? AppColors.white : Colors.grey),
                label: 'Focuse'),
            BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/Icons/user.svg",
                    color: currentIndex == 3 ? AppColors.white : Colors.grey),
                label: 'profile'),
          ]),
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
