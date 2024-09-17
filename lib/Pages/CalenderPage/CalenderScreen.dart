import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:todonew/Pages/CalenderPage/CalenderTime.dart';
import 'package:todonew/Pages/CalenderPage/TodosModel.dart';

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
  var formkey = GlobalKey<FormState>();
  Color _todayColor = Colors.transparent;
  Color _completedColors = Colors.transparent;
  bool isselected = false;
  TextEditingController _dateTimeController = TextEditingController();

  List<Widget> ListTasks() {
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
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          CalenderTime(),
          Padding(
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
                        if (_todayColor == Colors.transparent) {
                          _todayColor = Colors.blue;
                          _completedColors = Colors.transparent;
                        }
                        if (currentIndex == 0) {
                          today();
                        }
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
                                color: Colors.white,
                                fontWeight: FontWeight.w400)),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        currentIndex = 1;

                        if (_completedColors == Colors.transparent &&
                            currentIndex == 1) {
                          _completedColors = Colors.blue;
                          _todayColor = Colors.transparent;
                          // currentIndex = currentIndex;
                        }
                        if (currentIndex == 1) {
                          completed();
                        }
                        print(currentIndex);
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
                                color: Colors.white,
                                fontWeight: FontWeight.w400)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTasks()[currentIndex]
        ],
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
                return Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Form(
                        key: formkey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextFormField(
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return "You must Enter a task title";
                                }
                                if (value.length < 4) {
                                  return "You must Enter More than 4 Characters";
                                }
                                return null;
                              },
                              maxLength: 200,
                              textInputAction: TextInputAction.next,
                              controller: titlecontroller,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(8),
                                labelText: "Title",
                              ),
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02),
                            TextFormField(
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return "You must Enter a task description";
                                }
                                if (value.length < 20) {
                                  return "You must Enter More than 20 Characters";
                                }
                                return null;
                              },
                              maxLength: 200,
                              controller: descontroller,
                              textInputAction: TextInputAction.done,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(8),
                                labelText: "Detail",
                              ),
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.04),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    showBottomSheetDatePicker();
                                  },
                                  icon: Icon(Icons.timer_sharp),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.local_offer_outlined),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.flag_outlined),
                                ),
                                Spacer(),
                                IconButton(
                                  onPressed: () {
                                    if (formkey.currentState!.validate()) {
                                      setState(() {
                                        todos.add(
                                          TodoItemModel(
                                              title: titlecontroller.text,
                                              description: descontroller.text),
                                        );
                                        titlecontroller.clear();
                                        descontroller.clear();
                                        Navigator.pop(context);
                                      });
                                    }
                                  },
                                  icon: Icon(
                                    Icons.send_outlined,
                                    color: Colors.blue,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              });
        },
        child: const Icon(Icons.add, color: Colors.white70),
      ),
    );
  }

  void showBottomSheetDatePicker() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return DateTimeField(
            controller: _dateTimeController,
            format: DateFormat("yyyy-MM-dd HH:mm"),
            onShowPicker: (context, currentValue) async {
              final date = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
              );
              if (date != null) {
                final time = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay(hour: 9, minute: 0),
                );
                return DateTimeField.combine(date, time);
              } else {
                return currentValue;
              }
            },
          );
        });
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
    return Expanded(
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: todos.length,
          itemBuilder: (context, index) {
            return todoitem(
              todos[index],
            );
          }),
    );
  }

  Widget completed() {
    final Completeditem = todos.where((element) => element.isChecked).toList();
    return Expanded(
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: Completeditem.length,
          itemBuilder: (context, index) {
            return todoitem(Completeditem[index]);
          }),
    );
  }

  Widget todoitem(TodoItemModel value) {
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
                  value.isChecked ? Colors.blue : Colors.lightGreen,
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
                color: Color(0xff363636),
              ),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 2,
                      ),
                    ),
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      maxRadius: 8,
                      minRadius: 2,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.04,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: Text(
                            maxLines: 1,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            value.title,
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.width * 0.008,
                        ),
                        Row(
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
                                      color: Colors.white,
                                    ),
                                    Text(
                                      "Home",
                                      style: GoogleFonts.lato(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.01,
                              ),
                              Container(
                                padding: EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    shape: BoxShape.rectangle,
                                    border:
                                        Border.all(color: Color(0xff8687E7)),
                                    borderRadius: BorderRadius.circular(5)),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.flag,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 3,
                                    ),
                                    Text(
                                      "1",
                                      style: GoogleFonts.lato(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ])
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
