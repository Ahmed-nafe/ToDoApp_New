import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todonew/Pages/calender_page/TodosModel.dart';


class AddTaskBottomSheet extends StatefulWidget {

  final List<TodoItemModel>? todos;

  const AddTaskBottomSheet({super.key, this.todos});

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  TextEditingController titlecontroller = TextEditingController();
  TextEditingController descontroller = TextEditingController();
  TextEditingController _dateTimeController = TextEditingController();
  List<TodoItemModel> todos = [];

  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
        }
    );
  }
}

// ElevatedButton(
// style: ElevatedButton.styleFrom(
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(20)),
// elevation: 15,
// minimumSize: Size(
// MediaQuery.of(context).size.width,
// MediaQuery.of(context).size.height * 0.07,
// ),
// backgroundColor: const Color(0xff9395D3),
// ),
// onPressed: () {
// setState(() {
// widget.todos?.add(
// TodoItemModel(
// title: titlecontroller.text,
// description: descontroller.text),
// );
// });
// },
// child: Text(
// "add".toUpperCase(),
// style: const TextStyle(
// fontWeight: FontWeight.w600, color: Colors.white),
// ),
// ),
