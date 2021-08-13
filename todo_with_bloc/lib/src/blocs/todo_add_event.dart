part of 'todo_add_bloc.dart';

@immutable
abstract class TodoAddEvent {}

class TitleChanged extends TodoAddEvent {
  final String value;
  TitleChanged(this.value);
}

class SubTitleChanged extends TodoAddEvent {
  final String value;
  SubTitleChanged(this.value);
}

class DateTimeChanged extends TodoAddEvent {
  final DateTime value;
  DateTimeChanged(this.value);
}

class TodoAddRequested extends TodoAddEvent {}
