part of 'todos_cuibt_cubit.dart';

@immutable
sealed class TodosState {}

final class TodosInitial extends TodosState {}


final class TodosSucceed extends TodosState {
final List<TodoItemModel> todos ;

  TodosSucceed(this.todos);

}
