import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todonew/pages/calender_page/model/TodosModel.dart';

part 'todos_cuibt_state.dart';

class TodosCuibt extends Cubit<TodosState> {
  TodosCuibt() : super(TodosInitial());
  List<TodoItemModel> todos = [];
  bool isCompletedFilter = false;

  void addTodoItemsToList(TodoItemModel value) {
    todos.add(value);
    emit(TodosSucceed(todos));
  }

  void removeTodoItemsToList(int index) {
    todos.removeAt(index);
    emit(TodosSucceed(todos));
  }

  void markAsCompleted(TodoItemModel todo) {
    todo.isCompleted = !todo.isCompleted;
    emit(TodosSucceed(todos));
  }

  void filterTodosCompleted() {
    final completedItem = todos.where((elment) => elment.isCompleted).toList();
    if(completedItem.isEmpty){

    }
    isCompletedFilter = true;
    emit(TodosSucceed(completedItem));
  }

  void filterTodosToday() {
    isCompletedFilter = false;
    emit(
      TodosSucceed(todos),
    );
  }
}
