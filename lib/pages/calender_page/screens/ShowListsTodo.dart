import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShowListTodos extends StatefulWidget {
  const ShowListTodos({super.key});

  @override
  State<ShowListTodos> createState() => _ShowListTodosState();
}

class _ShowListTodosState extends State<ShowListTodos> {
  Color _todayColor = Colors.transparent;
  Color _completedColors = Colors.transparent;
  bool isselected = false;
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(
        MediaQuery.of(context).size.width * 0.04,
      ),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.09,
        color: const Color(0xff4C4C4C),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  currentIndex = 0;
                  if (_todayColor == Colors.transparent&&currentIndex==0) {
                    _todayColor = Colors.blue;
                    _completedColors = Colors.transparent;
                    currentIndex = currentIndex;
                  }
                  // print(currentIndex);
                });
              },
              child: Container(
                decoration: BoxDecoration(
                    color: _todayColor,
                    borderRadius: BorderRadius.circular(9),
                    border: Border.all(color: Colors.white, width: 1)),
                width: MediaQuery.of(context).size.width * 0.3,
                height: MediaQuery.of(context).size.height * 0.063,
                // color: Colors.blue,
                child: Center(
                  child: Text("Today",
                      style: GoogleFonts.lato(
                          color: Colors.white, fontWeight: FontWeight.w400)),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  currentIndex = 1;

                  if (_completedColors == Colors.transparent && currentIndex == 1) {
                    _completedColors = Colors.blue;
                    _todayColor = Colors.transparent;
                    currentIndex= currentIndex;
                  }
               // print(currentIndex);
                });
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.3,
                height: MediaQuery.of(context).size.height * 0.063,
                decoration: BoxDecoration(
                    color: _completedColors,
                    borderRadius: BorderRadius.circular(9),
                    border: Border.all(color: Colors.white, width: 1)),
                child: Center(
                  child: Text("Completed",
                      style: GoogleFonts.lato(
                          color: Colors.white, fontWeight: FontWeight.w400)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
