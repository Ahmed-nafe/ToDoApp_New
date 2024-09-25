import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todonew/core/themes/colors.dart';
import 'package:todonew/pages/calender_page/model/TodosModel.dart';
import 'package:todonew/pages/calender_page/model/category_model.dart';
import 'package:todonew/pages/cubits/todos_cuibt_cubit.dart';

class AddTaskBottomSheet extends StatefulWidget {
  const AddTaskBottomSheet({
    super.key,
  });

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  TextEditingController titleController = TextEditingController();
  TextEditingController desController = TextEditingController();
  DateTime? selectedDate;
  CategoryModel? selectedCategory;
  DateTime? selectedDateTime;
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
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Add Task",
                  style: GoogleFonts.lato(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: AppColors.white),
                ),
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),
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
                  controller: titleController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                    ),
                    contentPadding: const EdgeInsets.all(8),
                    labelText: "Title",
                  ),
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
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
                  controller: desController,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                    ),
                    contentPadding: EdgeInsets.all(8),
                    labelText: "Detail",
                  ),
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        showBottomSheetDatePicker();
                      },
                      icon: Icon(Icons.timer_sharp),
                    ),
                    IconButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return categoryDialog();
                            });
                      },
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
                          if (selectedDate == null) {
                            Fluttertoast.showToast(
                                msg: "Please selected date!",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0);
                            return;
                          }
                          if (selectedCategory == null) {
                            Fluttertoast.showToast(
                                msg: "Please selected Category!",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0);
                            return;
                          }
                          TimeOfDay selectedTime =
                              TimeOfDay.fromDateTime(selectedDateTime!);
                          context.read<TodosCuibt>().addTodoItemsToList(
                                TodoItemModel(
                                  time: selectedTime,
                                  date: selectedDate!,
                                  title: titleController.text,
                                  description: desController.text,
                                  categoryModel: selectedCategory!,
                                ),
                              );
                          titleController.clear();
                          desController.clear();
                          selectedDate = null;
                          selectedCategory = null;
                          Navigator.pop(context);
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
    DateTime nowTime = DateTime.now();
    showDatePicker(
        context: context,
        firstDate: DateTime(nowTime.year, nowTime.month),
        lastDate: nowTime.add(
          Duration(days: 365),
        ),
        initialDate: nowTime,
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.light(
                primary: AppColors.lightblueprimary,
                onBackground: Colors.white,
                onSurface: AppColors.white,
              ),
              dialogBackgroundColor: Colors.white,
              datePickerTheme: const DatePickerThemeData(
                headerBackgroundColor: AppColors.primarygray,
                headerForegroundColor: Colors.white,
                backgroundColor: AppColors.primarygray,
              ),
            ),
            child: child ?? SizedBox(),
          );
        }).then(
      (value) {
        if (value != null) {
          setState(() {
            selectedDate = value;
          });
          showTimePicker(
            builder: (BuildContext context, Widget? child) {
              return Theme(
                data: Theme.of(context).copyWith(
                  colorScheme: const ColorScheme.light(
                    primary: AppColors.lightblueprimary,
                    onBackground: Colors.white,
                    onSurface: AppColors.white,
                  ),
                  dialogBackgroundColor: AppColors.primarygray,
                  timePickerTheme: const TimePickerThemeData(
                    backgroundColor: AppColors.primarygray,
                    hourMinuteColor: AppColors.primarygray,
                    hourMinuteTextColor: AppColors.white,
                    dialBackgroundColor: AppColors.primarygray,
                    dialHandColor: AppColors.lightblueprimary,
                  ),
                ),
                child: child ?? SizedBox(),
              );
            },
            context: context,
            initialTime: TimeOfDay.fromDateTime(nowTime),
          ).then((selectedTime) {
            if (selectedTime != null) {
              DateTime fullDateTime = DateTime(
                selectedDate!.year,
                selectedDate!.month,
                selectedDate!.day,
                selectedTime.hour,
                selectedTime.minute,
              );

              setState(() {
                selectedDateTime = fullDateTime;
              });
            }
          });
        }
      },
    );
  }

  Dialog categoryDialog() {
    return Dialog(
      backgroundColor: AppColors.primarygray,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.015,
          ),
          Text(
            "Choose Category",
            style: GoogleFonts.lato(
                color: AppColors.white,
                fontSize: 20,
                fontWeight: FontWeight.w700),
          ),
          Divider(
            color: Color(0xff979797),
          ),
          Container(
            width: MediaQuery.sizeOf(context).width * 0.85,
            height: MediaQuery.sizeOf(context).height * 0.6,
            decoration: BoxDecoration(
              color: AppColors.primarygray,
              borderRadius: BorderRadius.circular(2),
            ),
            child: GridView.builder(
              itemCount: CategoryModel.categoryList.length,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCategory = CategoryModel.categoryList[index];
                    });

                    Navigator.of(context).pop();
                  },
                  child: GridTile(
                    footer: Center(
                      child: Text(
                        CategoryModel.categoryList[index].name,
                        style: GoogleFonts.lato(
                            color: AppColors.white.withOpacity(0.8),
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    child: Container(
                      margin: EdgeInsets.all(20),
                      padding: EdgeInsets.all(15),
                      color: CategoryModel.categoryList[index].color,
                      child: CategoryModel.categoryList[index].icon,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
