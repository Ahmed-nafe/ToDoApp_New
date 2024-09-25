import 'package:flutter/material.dart';
import 'package:todonew/pages/calender_page/model/category_model.dart';
import 'package:todonew/pages/calender_page/model/priority_model.dart';

class TodoItemModel {
  final String title;
  final DateTime date;
  final CategoryModel categoryModel;
  final PriorityModel priorityModel;
  final TimeOfDay? time;


  final String description;
  bool isCompleted;

  TodoItemModel( {
    required this.priorityModel,
    required this.time,
    required this.date,
    required this.categoryModel,
    required this.title,
    required this.description,
    this.isCompleted = false,
  });
}
