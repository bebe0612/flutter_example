part of 'todo_detail_bloc.dart';

@immutable
abstract class TodoDetailState {}

class TodoDetailInitial extends TodoDetailState {}

class TodoDetailInProgress extends TodoDetailState {}

class TodoDetailSuccess extends TodoDetailState {
  final TodoModel todoModel;
  TodoDetailSuccess(this.todoModel);
}

class TodoDetailFail extends TodoDetailState {}
