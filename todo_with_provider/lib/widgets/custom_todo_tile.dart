import 'package:flutter/material.dart';
import 'package:todo_with_provider/models/todo.dart';

class CustomTodoTile extends StatelessWidget {
  const CustomTodoTile({
    Key? key,
    @required this.todo,
  }) : super(key: key);
  final Todo? todo;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        todo!.title,
        style: Theme.of(context).textTheme.subtitle1,
      ),
      subtitle: Text(
        todo!.body,
        style: Theme.of(context).textTheme.bodyText2,
      ),
      leading: AspectRatio(
        aspectRatio: 1,
        child: Center(
          child: Icon(
            Icons.check_box,
          ),
        ),
      ),
    );
  }
}
