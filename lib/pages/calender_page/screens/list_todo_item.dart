import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:todonew/core/themes/colors.dart';
import 'package:todonew/pages/cubits/todos_cuibt_cubit.dart';

class ListTodoItemToday extends StatefulWidget {
  const ListTodoItemToday({super.key});

  @override
  State<ListTodoItemToday> createState() => _ListTodoItemTodayState();
}

class _ListTodoItemTodayState extends State<ListTodoItemToday> {
  @override
  Widget build(BuildContext context) {
    double widthSize = MediaQuery.sizeOf(context).width;
    double heightSize = MediaQuery.sizeOf(context).height;
    return BlocBuilder<TodosCuibt, TodosState>(
      builder: (context, state) {
        if (state is TodosSucceed) {
          if (state.todos.isEmpty) {
            return SingleChildScrollView(
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
          return Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: state.todos.length,
                itemBuilder: (context, index) {
                  final todosItem = state.todos[index];
                  return Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.width * 0.027,
                        horizontal: MediaQuery.of(context).size.height * 0.021),
                    child: Slidable(
                      startActionPane: ActionPane(
                        extentRatio: 0.3,
                        motion: BehindMotion(),
                        children: [
                          SlidableAction(
                            onPressed: (context) {
                              setState(() {
                                context
                                    .read<TodosCuibt>()
                                    .removeTodoItemsToList(index);
                              });
                            },
                            icon: Icons.delete,
                            label: "Delete",
                            backgroundColor: Colors.red,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12),
                              bottomLeft: Radius.circular(12),
                            ),
                          )
                        ],
                      ),
                      endActionPane: ActionPane(
                        extentRatio: 0.3,
                        motion: BehindMotion(),
                        children: [
                          SlidableAction(
                            onPressed: (context) {
                              context
                                  .read<TodosCuibt>()
                                  .markAsCompleted(todosItem);
                            },
                            icon: Icons.done_outline_sharp,
                            label: "Complete",
                            backgroundColor: todosItem.isCompleted
                                ? AppColors.blue
                                : Colors.lightGreen,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(12),
                              bottomRight: Radius.circular(12),
                            ),
                          )
                        ],
                      ),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: AppColors.primarygray,
                            ),
                            child: ListTile(
                              title: Text(
                                maxLines: 1,
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                                todosItem.title,
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.white),
                              ),
                              subtitle: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                        "Today ${DateFormat("MEd").format(todosItem.date)}",
                                        style: GoogleFonts.lato(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xffAFAFAF))),
                                  ),
                                  Row(children: [
                                    Container(
                                      margin: EdgeInsets.symmetric(
                                        horizontal: widthSize * 0.01,
                                      ),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: widthSize * 0.029,
                                          vertical: heightSize * 0.004),
                                      decoration: BoxDecoration(
                                          color: todosItem.categoryModel.color,
                                          shape: BoxShape.rectangle,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Row(
                                        // mainAxisAlignment: MainAxisAlignment.spaceBetweenS,
                                        children: [
                                          todosItem.categoryModel.icon,
                                          SizedBox(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.03,
                                          ),
                                          Text(
                                            todosItem.categoryModel.name,
                                            style: GoogleFonts.lato(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 12,
                                                color: AppColors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(2),
                                      margin: EdgeInsets.all(2),
                                      decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          shape: BoxShape.rectangle,
                                          border: Border.all(
                                              color: Color(0xff8687E7)),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.flag,
                                            color: AppColors.white,
                                          ),
                                          SizedBox(
                                            width: 3,
                                          ),
                                          Text(
                                            "1",
                                            style: GoogleFonts.lato(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 12,
                                                color: AppColors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ])
                                ],
                              ),
                              leading: todosItem.isCompleted
                                  ? Icon(
                                      Icons.check_circle,
                                      color: AppColors.lightblueprimary,
                                    )
                                  : Icon(
                                      Icons.circle_outlined,
                                      color: AppColors.white,
                                    ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          );
        } else {
          return SingleChildScrollView(
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
