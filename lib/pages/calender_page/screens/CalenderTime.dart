import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todonew/core/themes/colors.dart';

class CalenderTime extends StatefulWidget {
  const CalenderTime({super.key});

  @override
  State<CalenderTime> createState() => _CalenderTimeState();
}

class _CalenderTimeState extends State<CalenderTime> {
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();
  DateTime _selectedDate = DateTime.now();
  late String formattedMonth;
  late String formattedYear;


  // _HomeScreenState(this.todos);

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
    updateFormattedDate();
  }

  void updateFormattedDate() {
    setState(() {
      formattedMonth = DateFormat('MMMM').format(_focusedDay);
      formattedYear = DateFormat('yyyy').format(_focusedDay);
    });
  }

  void _prevMonth() {
    setState(() {
      _focusedDay =
          DateTime(_focusedDay.year, _focusedDay.month - 1, _focusedDay.day);
      updateFormattedDate();
    });
  }

  void _nextMonth() {
    setState(() {
      _focusedDay =
          DateTime(_focusedDay.year, _focusedDay.month + 1, _focusedDay.day);
      updateFormattedDate();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff363636),
      height: MediaQuery.of(context).size.height * 0.17,
      child: CalendarTimeline(
        showYears: true,
        shrinkFontSize: 12,
        initialDate: DateTime.now(),
        firstDate: DateTime.now().subtract(Duration(days: 365)),
        lastDate: DateTime.now().add(Duration(days: 5000)),
        onDateSelected: (date) {},
        leftMargin: 100,
        monthColor: AppColors.white,
        dayColor: AppColors.white,
        activeDayColor: AppColors.white,
        activeBackgroundDayColor:AppColors.lightblueprimary,
        dotColor: Color(0xFF333A47),
        // selectableDayPredicate: (date) => date.day != 23,
        locale: 'en_ISO',
      ),
    );
  }
}
// Container(
//   height: MediaQuery.of(context).size.height * 0.18,
//   color: const Color(0xff363636),
//   child: Column(
//     children: [
//       Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           IconButton(
//             icon: const Icon(Icons.arrow_back_ios_new),
//             color: Colors.white,
//             onPressed: _prevMonth,
//           ),
//           Column(
//             children: [
//               Text(
//                 formattedMonth,
//                 style: GoogleFonts.lato(
//                   color: Colors.white,
//                   fontWeight: FontWeight.w500,
//                   fontSize: 14,
//                 ),
//               ),
//               Text(
//                 formattedYear,
//                 style: GoogleFonts.lato(
//                   color: Colors.white,
//                   fontWeight: FontWeight.w400,
//                   fontSize: 10,
//                 ),
//               ),
//             ],
//           ),
//           IconButton(
//             icon: const Icon(Icons.arrow_forward_ios_sharp),
//             color: Colors.white,
//             onPressed: _nextMonth,
//           ),
//         ],
//       ),
//       SizedBox(
//         height: 100, // Height for the calendar row
//         child: ListView.builder(
//           scrollDirection: Axis.horizontal,
//           itemCount: 30, // Number of days to display
//           itemBuilder: (context, index) {
//             final date = _focusedDay.add(Duration(days: index));
//             final dayName = DateFormat('EEE').format(date);
//             return GestureDetector(
//               onTap: () {
//                 setState(() {
//                   _selectedDay = date;
//                 });
//               },
//               child: Container(
//                 width: 60,
//                 margin: const EdgeInsets.all(4),
//                 decoration: BoxDecoration(
//                   color: _selectedDay == date
//                       ? const Color(0xff8687E7)
//                       : const Color(0xff272727),
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: Center(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         '${dayName}',
//                         style: const TextStyle(
//                             fontSize: 18, color: Colors.white),
//                       ),
//                       Text(
//                         '${date.day}',
//                         // You can customize weekday format
//                         style: const TextStyle(
//                             fontSize: 12, color: Colors.white),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     ],
//   ),
// ),