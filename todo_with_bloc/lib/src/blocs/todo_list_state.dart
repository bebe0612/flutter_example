part of 'todo_list_bloc.dart';

@immutable
abstract class TodoListState {}

class TodoListInitial extends TodoListState {}

class TodoListInProgress extends TodoListState {}

class TodoListSuccess extends TodoListState {
  final List<TodoModel> todoList;
  TodoListSuccess(this.todoList);
}

class TodoListFail extends TodoListState {}

class TodoListTaskLoading extends TodoListSuccess {
  TodoListTaskLoading(List<TodoModel> todoList) : super(todoList);
}

class TodoListTaskFail extends TodoListSuccess {
  final String msg;
  TodoListTaskFail(List<TodoModel> todoList, this.msg) : super(todoList);
}
