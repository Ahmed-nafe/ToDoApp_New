import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todonew/pages/calender_page/TodosModel.dart';

part 'todos_cuibt_state.dart';

class TodosCuibt extends Cubit<TodosState> {

  TodosCuibt() : super(TodosInitial());
  List <String> todos = [];

  void addTodoItemsToList (String value){
    todos.add(value);
    emit(TodosSucceed(todos));
  }
}
