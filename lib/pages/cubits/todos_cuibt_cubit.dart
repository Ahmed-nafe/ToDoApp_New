import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todonew/pages/calender_page/model/TodosModel.dart';

part 'todos_cuibt_state.dart';

class TodosCuibt extends Cubit<TodosState> {
  TodosCuibt() : super(TodosInitial());
  List<TodoItemModel> todos = [];
  bool isCompletedFilter = false;
  bool isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

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
  void filterByDate(DateTime date) {
    final newList = todos.where((elment) => isSameDay(elment.date, date)).toList();

    emit(
      TodosSucceed(newList),
    );
  }
}
