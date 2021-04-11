import 'package:flutter/material.dart';
import 'package:todo_with_provider/models/todo.dart';

class TodoProvider extends ChangeNotifier {
  Map<DateTime, List<Todo>> todoMap = {};
  TodoProvider();

  Todo? _currentTodo;
  Todo get currentTodo => _currentTodo!;
  set currentTodo(Todo todo) {
    _currentTodo = todo;
    notifyListeners();
  }

  // get todo objects at specific datetime
  List<Todo> getTodos(DateTime dateTime) {
    if (todoMap.length == 0) {
      // Map jsonMap = DatabaseService().read(kTodoBoxName)!;

      // todoMap = jsonMap.map(
      //     (key, value) => MapEntry(DateTime.parse(key), jsonDecode(value)));

      return [];
    }
    return todoMap[dateTime]!;
  }
}
