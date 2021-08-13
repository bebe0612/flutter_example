part of 'todo_add_bloc.dart';

@immutable
abstract class TodoAddState {
  final TodoAddForm form;
  TodoAddState(this.form);
}

class TodoAddInitial extends TodoAddState {
  TodoAddInitial(TodoAddForm form) : super(form);
}

class TodoAddInProgress extends TodoAddState {
  TodoAddInProgress(TodoAddForm form) : super(form);
}

class TodoAddSuccess extends TodoAddState {
  TodoAddSuccess(TodoAddForm form) : super(form);
}

class TodoAddFail extends TodoAddState {
  TodoAddFail(TodoAddForm form) : super(form);
}
