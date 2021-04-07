import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

const String kTodoBoxName = 'todo';

class DatabaseService {
  static final DatabaseService _instance = DatabaseService._internal();
  factory DatabaseService() => _instance;
  DatabaseService._internal();

  Map<String, Box> boxes = Map();
  void init() async {
    await Hive.initFlutter();

    boxes[kTodoBoxName] = Hive.box(kTodoBoxName);
  }

  // READ
  Map? read(String boxName) {
    Box box;
    if (boxes[kTodoBoxName] != null) {
      box = boxes[kTodoBoxName]!;
      return box.toMap();
    } else {
      return null;
    }
  }
  //DELETE
}
