import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todonew/core/themes/colors.dart';
import 'package:todonew/pages/calender_page/screens/list_todo_item_Today.dart';
import 'package:todonew/pages/cubits/todos_cuibt_cubit.dart';

class ListTodoItemCompleted extends StatefulWidget {
  const ListTodoItemCompleted({super.key});

  @override
  State<ListTodoItemCompleted> createState() => _ListTodoItemCompletedState();
}

class _ListTodoItemCompletedState extends State<ListTodoItemCompleted> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodosCuibt, TodosState>(
      builder: (context, state) {
        if (state is TodosSucceed) {
          print("Ahmed $state");
          final completeItems =
              state.todos.where((element) => element.isChecked).toList();
          // print("Complete Items: ${completeItems.length}");
          if (completeItems.isEmpty) {
            return Expanded(
              child: Center(
                child: Text(
                  "No Items Completed  ",
                  style: TextStyle(color: AppColors.white),
                ),
              ),
            );
          }
          return Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: completeItems.length,
                itemBuilder: (context, index) {
                  return ListTodoItemToday();
                }),
          );
        } else {
          return Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: SvgPicture.asset(
                    "assets/Checklist-rafiki 1.svg",
                  ),
                ),
                Text(
                  "What do you want to do today?",
                  style: GoogleFonts.lato(
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                    color: AppColors.white,
                  ),
                ),
                Text(
                  "Tap + to add your tasks",
                  style: GoogleFonts.lato(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: AppColors.white,
                      height: 3),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
