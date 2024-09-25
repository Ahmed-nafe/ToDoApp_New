import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todonew/core/themes/colors.dart';
import 'package:todonew/pages/cubits/todos_cuibt_cubit.dart';

class CalenderTime extends StatefulWidget {
  const CalenderTime({super.key});

  @override
  State<CalenderTime> createState() => _CalenderTimeState();
}

class _CalenderTimeState extends State<CalenderTime> {
  DateTime _focusedDay = DateTime.now();
  TimeOfDay? _selectedTime;

  @override
  void initState() {
    super.initState();

    context.read<TodosCuibt>().filterByDate(_focusedDay);
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodosCuibt, TodosState>(
      builder: (context, state) {
        return Container(
          color: Color(0xff363636),
          height: MediaQuery.of(context).size.height * 0.17,
          child: TableCalendar(
            calendarFormat: CalendarFormat.week,
            firstDay: DateTime.utc(2024, 8, 1),
            lastDay: DateTime.utc(2030, 09, 20),
            focusedDay: _focusedDay,
            currentDay: _focusedDay,
            onDaySelected: (selectedDate, focusedDate) {
              setState(() {
                _focusedDay = selectedDate;
              });
              context.read<TodosCuibt>().filterByDate(_focusedDay);

              },
            headerStyle: HeaderStyle(
              titleTextFormatter: (date, locale) {
                return "${DateFormat('MMMM', locale).format(date)}\n${DateFormat(
                  'yyyy',
                  locale,
                ).format(date)}";
              },
              titleTextStyle: GoogleFonts.lato(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: AppColors.white),
              formatButtonVisible: false,
              titleCentered: true,
            ),
            calendarStyle: CalendarStyle(
              todayDecoration: BoxDecoration(
                  color: AppColors.lightblueprimary, shape: BoxShape.circle),
              defaultTextStyle: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w400),
            ),
            daysOfWeekStyle: DaysOfWeekStyle(
                weekendStyle: GoogleFonts.lato(
                    color: Colors.red, fontWeight: FontWeight.w400),
                weekdayStyle: GoogleFonts.lato(
                    color: Colors.white, fontWeight: FontWeight.w400)),
          ),

        );
      },
    );
  }
}
