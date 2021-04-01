import 'package:equatable/equatable.dart';

class Todo extends Equatable {
  final String id;
  final DateTime date;
  final String title;
  final String body;
  final bool isDone;

  @override
  List<Object> get props => [id];
  Todo({
    required this.id,
    required this.date,
    required this.title,
    required this.body,
    required this.isDone,
  });
}
