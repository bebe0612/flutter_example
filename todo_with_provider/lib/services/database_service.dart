import 'dart:async';

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_with_provider/models/todo.dart';

const String kTodoBoxName = 'todo';

class DatabaseService {
  static final DatabaseService _instance = DatabaseService._internal();
  factory DatabaseService() => _instance;
  DatabaseService._internal();

  Box? _todoBox;
  void init() async {
    await Hive.initFlutter();
    _todoBox = Hive.box(kTodoBoxName);
  }

  Map<DateTime, dynamic> read() {
    print(_todoBox!.toMap().runtimeType);
    return {};
  }

  void update(Map<DateTime, List<Todo>> todoMap) {
    todoMap.forEach((key, value) {
      _todoBox!.put(key, value);
    });

    return;
  }
  //DELETE
}
