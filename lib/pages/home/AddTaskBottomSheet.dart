import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todonew/core/themes/colors.dart';
import 'package:todonew/pages/calender_page/model/TodosModel.dart';
import 'package:todonew/pages/calender_page/model/category_model.dart';
import 'package:todonew/pages/cubits/todos_cuibt_cubit.dart';

class AddTaskBottomSheet extends StatefulWidget {
  // final List<TodoItemModel>? todos;

  const AddTaskBottomSheet({
    super.key,
  });

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  TextEditingController titlecontroller = TextEditingController();
  TextEditingController descontroller = TextEditingController();
  TextEditingController _dateTimeController = TextEditingController();

  DateTime? selectedDate;

  CategoryModel? selectedCategory;

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
                  controller: descontroller,
                  textInputAction: TextInputAction.done,
                  decoration: const InputDecoration(
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
                          context.read<TodosCuibt>().addTodoItemsToList(
                                TodoItemModel(
                                  date: selectedDate!,
                                  title: titlecontroller.text,
                                  description: descontroller.text,
                                  categoryModel: selectedCategory!,
                                ),
                              );
                          titlecontroller.clear();
                          descontroller.clear();
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
    ).then(
      (value) {
        setState(() {
          selectedDate = value;
        });
      },
    );
  }

  Dialog categoryDialog() {
    return Dialog(
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.85,
        height: MediaQuery.sizeOf(context).height * 0.6,
        decoration: BoxDecoration(
          color: AppColors.primarygray,
          borderRadius: BorderRadius.circular(4),
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
                    )),
              );
            }),
      ),
    );
  }
}
