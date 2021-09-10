part of 'todo_detail_bloc.dart';

@immutable
abstract class TodoDetailEvent {}

class TodoDetailRequested extends TodoDetailEvent {
  final int todoId;

  TodoDetailRequested({required this.todoId});
}
