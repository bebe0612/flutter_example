part of 'todo_list_bloc.dart';

@immutable
abstract class TodoListEvent {}

class TodoListRequested extends TodoListEvent {}

class RemoveTodoRequested extends TodoListEvent {
  final int todoId;
  RemoveTodoRequested(this.todoId);
}
