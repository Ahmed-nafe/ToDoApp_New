import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todonew/pages/calender_page/TodosModel.dart';

part 'todos_cuibt_state.dart';

class TodosCuibt extends Cubit<TodosState> {
  TodosCuibt() : super(TodosInitial());
  List<TodoItemModel> todos = [];

  void addTodoItemsToList(TodoItemModel value) {
    todos.add(value);
    emit(TodosSucceed(todos));
  }
  void removeTodoItemsToList(int index) {
    todos.removeAt(index);
    emit(TodosSucceed(todos));
  }
}
