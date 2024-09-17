class TodoItemModel {
  String title;

  String description;
  bool isChecked;

  TodoItemModel({
    required this.title,
    required this.description,
    this.isChecked = false,
  });
}
