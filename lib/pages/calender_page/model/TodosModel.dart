import 'package:todonew/pages/calender_page/model/category_model.dart';

class TodoItemModel {
  final String title;
  final DateTime date;
  final CategoryModel categoryModel;

  final String description;
  bool isCompleted;

  TodoItemModel({
    required this.date,
    required this.categoryModel,
    required this.title,
    required this.description,
    this.isCompleted = false,
  });
}
