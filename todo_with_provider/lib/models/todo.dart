import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

@HiveType(typeId: 30)
class Todo extends Equatable {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final DateTime date;
  @HiveField(2)
  final String title;
  @HiveField(3)
  final String body;
  @HiveField(4)
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

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      body: '',
      date: DateTime.now(),
      id: '1',
      isDone: true,
      title: '',
    );
  }
}
