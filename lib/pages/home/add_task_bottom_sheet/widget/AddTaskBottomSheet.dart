import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todonew/core/themes/colors.dart';
import 'package:todonew/pages/calender_page/model/TodosModel.dart';
import 'package:todonew/pages/calender_page/model/category_model.dart';
import 'package:todonew/pages/cubits/todos_cuibt_cubit.dart';
import 'package:todonew/pages/home/add_task_bottom_sheet/widget/category_dialog.dart';
import 'package:todonew/pages/home/add_task_bottom_sheet/widget/custom_text_form_field.dart';

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
  final FocusNode _focusNode = FocusNode();
  bool autofocus = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.sizeOf(context).height * 0.015,
          vertical: MediaQuery.sizeOf(context).width * 0.015,
        ),
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
              CustomTextFormField(
                  controller: titleController,
                  hintText: "title",
                  autofocus: true),
              CustomTextFormField(
                controller: desController,
                hintText: "Description",
                maxLines: 15,
                autofocus: true,
                maxLength: 200,
              ),
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
                            return CategoryDialog();
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
    );
  }

  showBottomSheetDatePicker() {
    DateTime nowTime = DateTime.now();
    return showDatePicker(
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
}
