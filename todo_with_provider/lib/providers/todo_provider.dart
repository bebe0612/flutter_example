import 'package:flutter/material.dart';
import 'package:todo_with_provider/models/todo.dart';

class TodoProvider extends ChangeNotifier {
  List<Todo> todoList = [];

  TodoProvider();

  DateTime _focusedDate = DateTime.now();
  DateTime get focusedDate => _focusedDate;
  set focusedDate(DateTime date) {
    _focusedDate = date;
    notifyListeners();
  }

  Todo? _currentTodo;
  Todo get currentTodo => _currentTodo!;
  set currentTodo(Todo todo) {
    _currentTodo = todo;
    notifyListeners();
  }

  List<Todo> getTodos(DateTime dateTime) {
    return todoList.where((todo) => todo.date == dateTime).toList();
  }
}
