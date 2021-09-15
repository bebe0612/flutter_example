import 'dart:async';

import 'package:todo_with_bloc/src/models/todo_add_form.dart';
import 'package:todo_with_bloc/src/models/todo_model.dart';
import 'package:todo_with_bloc/src/services/database_helper.dart';

class TodoRepository {
  StreamController<TodoModel> _streamController = StreamController.broadcast();

  Stream<TodoModel> get onTodoChanged => _streamController.stream;

  Future<TodoModel> getTodoModelById(int id) async {
    final record = await DatabaseHelper().selectById(id);
    return TodoModel.fromJson(record);
  }

  Future<List<TodoModel>> getTodoList() async {
    List records = await DatabaseHelper().selectAll();

    return records.map((e) => TodoModel.fromJson(e)).toList();
  }

  Future<void> addTodo(TodoAddForm form) async {
    await DatabaseHelper().insert(form.toJson());
    _streamController
        .add(TodoModel(id: 1, title: '', subTitle: '', date: DateTime.now()));
  }

  Future<void> removeTodo(int id) async {
    await DatabaseHelper().delete(id);
    _streamController
        .add(TodoModel(id: 1, title: '', subTitle: '', date: DateTime.now()));
  }

  Future<void> modifyTodo(int id, TodoAddForm form) async {
    await DatabaseHelper().update(id, form.toJson());
    _streamController
        .add(TodoModel(id: 1, title: '', subTitle: '', date: DateTime.now()));
  }
}
