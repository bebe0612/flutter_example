part of 'todo_modify_bloc.dart';

@immutable
abstract class TodoModifyState {
  final TodoAddForm form;

  TodoModifyState(this.form);
}

class TodoModifyInitial extends TodoModifyState {
  TodoModifyInitial(TodoAddForm form) : super(form);
}

class TodoModifyInProgress extends TodoModifyState {
  TodoModifyInProgress(TodoAddForm form) : super(form);
}

class TodoModifySuccess extends TodoModifyState {
  TodoModifySuccess(TodoAddForm form) : super(form);
}

class TodoModifyFail extends TodoModifyState {
  TodoModifyFail(TodoAddForm form) : super(form);
}
