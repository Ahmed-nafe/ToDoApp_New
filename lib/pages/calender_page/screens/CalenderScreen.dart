import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:todonew/Pages/calender_page/TodosModel.dart';
import 'package:todonew/core/themes/colors.dart';
import 'package:todonew/pages/calender_page/screens/CalenderTime.dart';
import 'package:todonew/pages/calender_page/screens/ShowListsTodo.dart';
import 'package:todonew/pages/calender_page/screens/cubits/todos_cuibt_cubit.dart';

class CalenderScreen extends StatefulWidget {
  static const String routeName = "calenderScreen";

  const CalenderScreen({
    super.key,
  });

  @override
  State<CalenderScreen> createState() => _CalenderScreenState();
}

class _CalenderScreenState extends State<CalenderScreen> {
  List<TodoItemModel> todos = [];
  int currentIndex = 0;
  TextEditingController titlecontroller = TextEditingController();
  TextEditingController descontroller = TextEditingController();

  bool isselected = false;

  List<Widget> ListTask() {
    return [
      today(),
      completed(),
    ];
  }

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
          ListTask()[currentIndex],
        ],
      ),
    );
  }

  //
  //   final date = showDatePicker(
  //     context: context,
  //     initialDate: DateTime.now(),
  //     firstDate: DateTime.now(),
  //     lastDate: DateTime.now().add(
  //       Duration(days: 365),
  //     ),
  //   );
  //   if (date != null) {
  //     showTimePicker(
  //       context: context,
  //       initialTime: TimeOfDay(hour: 9, minute: 0),
  //     );
  //   } else {
  //   }
  // }

  Widget today() {
    return BlocBuilder<TodosCuibt, TodosState>(
      builder: (context, state) {
        print("the Ahmed $state");
        if (state is TodosSucceed) {
          return Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: todos.length,
                itemBuilder: (context, index) {
                  return listTodoItem(
                    todos[index],
                  );
                }),
          );
        } else {
          return Center(
            child: Text(
              "ToDo Items Not Found",
              style: AppColors.primarystyle,
            ),
          );
        }
      },
    );
  }

  Widget completed() {
    final Completeditem = todos.where((element) => element.isChecked).toList();
    return Expanded(
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: Completeditem.length,
          itemBuilder: (context, index) {
            return listTodoItem(Completeditem[index]);
          }),
    );
  }

  Widget listTodoItem(TodoItemModel value) {
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
                  todos.remove(value);
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
                setState(() {
                  value.isChecked = !value.isChecked;
                });
              },
              icon: Icons.done_outline_sharp,
              label: "Complete",
              backgroundColor:
                  value.isChecked ? AppColors.blue : Colors.lightGreen,
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
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: AppColors.primarygray,
              ),
              child: ListTile(
                title: Text(
                  maxLines: 1,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  value.title,
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: AppColors.white),
                ),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Today At 16:15",
                        style: GoogleFonts.lato(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xffAFAFAF))),
                    Row(children: [
                      Container(
                        margin: EdgeInsets.all(2),
                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                            color: Color(0xffFF8080),
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(5)),
                        child: Row(
                          children: [
                            Icon(
                              Icons.home,
                              color: AppColors.white,
                            ),
                            Text(
                              "Home",
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
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            shape: BoxShape.rectangle,
                            border: Border.all(color: Color(0xff8687E7)),
                            borderRadius: BorderRadius.circular(5)),
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
                leading: Icon(
                  Icons.circle_outlined,
                  color: AppColors.white,
                ),

                // // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // children: [
                //   Container(
                //     decoration: BoxDecoration(
                //       shape: BoxShape.circle,
                //       border: Border.all(
                //         color: AppColors.white,
                //         width: 2,
                //       ),
                //     ),
                //     child: CircleAvatar(
                //       backgroundColor: Colors.transparent,
                //       maxRadius: 8,
                //       minRadius: 2,
                //     ),
                //   ),
                //   SizedBox(
                //     width: MediaQuery.of(context).size.width * 0.04,
                //   ),
                //   Expanded(
                //     child: Column(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: [
                //         SizedBox(
                //           width: MediaQuery.of(context).size.width * 0.7,
                //           child: Text(
                //             maxLines: 1,
                //             softWrap: true,
                //             overflow: TextOverflow.ellipsis,
                //             value.title,
                //             style: TextStyle(
                //                 fontWeight: FontWeight.w600,
                //                 color: AppColors.white),
                //           ),
                //         ),
                //         SizedBox(
                //           height: MediaQuery.of(context).size.width * 0.008,
                //         ),
                //         Row(
                //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //           children: [
                //             Text("Today At 16:15",
                //                 style: GoogleFonts.lato(
                //                     fontSize: 14,
                //                     fontWeight: FontWeight.w400,
                //                     color: Color(0xffAFAFAF))),
                //             Row(children: [
                //               Container(
                //                 margin: EdgeInsets.all(2),
                //                 padding: EdgeInsets.all(2),
                //                 decoration: BoxDecoration(
                //                     color: Color(0xffFF8080),
                //                     shape: BoxShape.rectangle,
                //                     borderRadius: BorderRadius.circular(5)),
                //                 child: Row(
                //                   children: [
                //                     Icon(
                //                       Icons.home,
                //                       color: AppColors.white,
                //                     ),
                //                     Text(
                //                       "Home",
                //                       style: GoogleFonts.lato(
                //                           fontWeight: FontWeight.w400,
                //                           fontSize: 12,
                //                           color: AppColors.white),
                //                     ),
                //                   ],
                //                 ),
                //               ),
                //               SizedBox(
                //                 width: MediaQuery.of(context).size.width * 0.01,
                //               ),
                //               Container(
                //                 padding: EdgeInsets.all(2),
                //                 decoration: BoxDecoration(
                //                     color: Colors.transparent,
                //                     shape: BoxShape.rectangle,
                //                     border:
                //                         Border.all(color: Color(0xff8687E7)),
                //                     borderRadius: BorderRadius.circular(5)),
                //                 child: Row(
                //                   children: [
                //                     Icon(
                //                       Icons.flag,
                //                       color: AppColors.white,
                //                     ),
                //                     SizedBox(
                //                       width: 3,
                //                     ),
                //                     Text(
                //                       "1",
                //                       style: GoogleFonts.lato(
                //                           fontWeight: FontWeight.w400,
                //                           fontSize: 12,
                //                           color: AppColors.white),
                //                     ),
                //                   ],
                //                 ),
                //               ),
                //             ])
                //           ],
                //         ),
                //       ],
                //     ),
                //   ),
                // ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
