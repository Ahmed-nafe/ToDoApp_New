import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todonew/core/themes/colors.dart';
import 'package:todonew/pages/cubits/todos_cuibt_cubit.dart';

class ShowListTodos extends StatefulWidget {
  ShowListTodos({
    super.key,
  });

  @override
  State<ShowListTodos> createState() => _ShowListTodosState();
}

class _ShowListTodosState extends State<ShowListTodos> {
  // int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodosCuibt, TodosState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.all(
            MediaQuery.of(context).size.width * 0.04,
          ),
          child: Container(
            padding: EdgeInsets.all(15),
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.09,
            color: AppColors.dimGray,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      context.read<TodosCuibt>().filterTodosToday();
                    },
                    style: TextButton.styleFrom(
                      backgroundColor:
                          context.read<TodosCuibt>().isCompletedFilter
                              ? Colors.transparent
                              : AppColors.lightblueprimary,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: AppColors.white),
                          borderRadius: BorderRadius.circular(4)),
                    ),
                    child: Text(
                      "Today",
                      style: GoogleFonts.lato(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.05,
                ),
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      context.read<TodosCuibt>().filterTodosCompleted();
                    },
                    style: TextButton.styleFrom(
                      backgroundColor:
                          context.read<TodosCuibt>().isCompletedFilter
                              ? AppColors.lightblueprimary
                              : Colors.transparent,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: AppColors.white),
                          borderRadius: BorderRadius.circular(4)),
                    ),
                    child: Text(
                      "Completed",
                      style: GoogleFonts.lato(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
