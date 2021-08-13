import 'package:flutter/material.dart';
import 'package:todo_with_bloc/src/services/database_helper.dart';
import 'package:todo_with_bloc/src/views/todo_list_view.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  Future<void> init(BuildContext context) async {
    await DatabaseHelper().init();

    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => TodoListView()));
  }

  @override
  Widget build(BuildContext context) {
    init(context);
    return Material();
  }
}
