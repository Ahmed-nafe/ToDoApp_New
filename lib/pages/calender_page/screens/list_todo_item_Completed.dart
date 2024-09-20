import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todonew/core/themes/colors.dart';
import 'package:todonew/pages/calender_page/screens/cubits/todos_cuibt_cubit.dart';
import 'package:todonew/pages/calender_page/screens/list_todo_item_Today.dart';

class ListTodoItemCompleted extends StatefulWidget {
  const ListTodoItemCompleted({super.key});

  @override
  State<ListTodoItemCompleted> createState() => _ListTodoItemCompletedState();
}

class _ListTodoItemCompletedState extends State<ListTodoItemCompleted> {
  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<TodosCuibt, TodosState>(
      builder: (context, state) {
        if (state is TodosSucceed) {
          final completeItems =
          state.todos.where((element) => element.isChecked).toList();
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
            child: Center(
              child: Text(
                "No Items Completed  ",
                style: TextStyle(color: AppColors.white),
              ),
            ),
          );
        }
      },
    );
  }
}
