import 'dart:async';

import 'package:todo_with_bloc/src/models/todo_add_form.dart';
import 'package:todo_with_bloc/src/models/todo_model.dart';
import 'package:todo_with_bloc/src/services/database_helper.dart';

class TodoRepository {
  StreamController<TodoModel> _streamController = StreamController.broadcast();

  Stream<TodoModel> get onTodoChanged => _streamController.stream;

  Future<TodoModel> getTodoModelById(int id) async {
    await Future.delayed(Duration(milliseconds: 2000));
    return TodoModel(
      id: id,
      title: '세탁하기',
      subTitle: '세탁',
      date: DateTime.now(),
    );
  }

  Future<List<TodoModel>> getTodoList() async {
    List records = await DatabaseHelper().selectAll();

    return records.map((e) => TodoModel.fromJson(e)).toList();
  }

  Future<void> addTodo(TodoAddForm form) async {
    await Future.delayed(Duration(milliseconds: 1000));
    await DatabaseHelper().insert(form.toJson());
    _streamController
        .add(TodoModel(id: 1, title: '', subTitle: '', date: DateTime.now()));
  }
}
