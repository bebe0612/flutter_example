part of 'todo_modify_bloc.dart';

@immutable
abstract class TodoModifyEvent {}

class TodoModifyRequested extends TodoModifyEvent {}

class PageInitRequested extends TodoModifyEvent {}

class TitleChanged extends TodoModifyEvent {
  final String value;
  TitleChanged(this.value);
}

class SubTitleChanged extends TodoModifyEvent {
  final String value;
  SubTitleChanged(this.value);
}

class DateChanged extends TodoModifyEvent {
  final DateTime value;
  DateChanged(this.value);
}
