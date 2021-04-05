import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_with_provider/providers/todo_provider.dart';
import 'package:todo_with_provider/utils/util.dart';
import 'package:todo_with_provider/widgets/widgets.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var todoProvider = Provider.of<TodoProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("My Todo Calendar"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _onFloatingActionButtonPressed,
      ),
      body: Column(
        children: [
          CustomCalendar(
            initialFocusedDate: DateTime.now(),
            onFocusedDateChanged: (date) {},
          ),
          Divider(),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                Icon(
                  CupertinoIcons.calendar,
                  color: Theme.of(context).primaryColor,
                ),
                SizedBox(width: 10),
                Text(
                  prettyDateToString(todoProvider.focusedDate),
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(color: Theme.of(context).primaryColor),
                ),
              ],
            ),
          ),
          Expanded(
            child: Scrollbar(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ...todoProvider
                        .getTodos(todoProvider.focusedDate)
                        .map((e) => CustomTodoTile(todo: e))
                        .toList()
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void _onFloatingActionButtonPressed() async {
    //
  }
}
