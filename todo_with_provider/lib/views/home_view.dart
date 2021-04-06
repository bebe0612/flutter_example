import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_with_provider/models/todo.dart';
import 'package:todo_with_provider/providers/todo_provider.dart';
import 'package:todo_with_provider/utils/util.dart';
import 'package:todo_with_provider/views/add_todo_view.dart';
import 'package:todo_with_provider/widgets/widgets.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // page's state
  DateTime _selectedDay = DateTime.now();

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
            initialSelectedDay: DateTime.now(),
            selectedDay: _selectedDay,
            onDaySelected: (day) {
              setState(() {
                _selectedDay = day;
              });
            },
          ),
          Divider(),
          _buildTodoTitle(),
          Expanded(
            child: _buildTodoTileList(),
          )
        ],
      ),
    );
  }

  Widget _buildTodoTileList() {
    var todoProvider = Provider.of<TodoProvider>(context, listen: false);
    List<Todo> todoList = todoProvider.getTodos(_selectedDay);

    return todoList.length == 0
        ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  CupertinoIcons.ellipses_bubble,
                  color: Colors.grey,
                  size: 30,
                ),
                SizedBox(height: 10),
                Text(
                  "Nothing To Do !",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                )
              ],
            ),
          )
        : Scrollbar(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ...todoList.map((e) => TodoTile(todo: e)).toList(),
                ],
              ),
            ),
          );
  }

  Container _buildTodoTitle() {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          Icon(
            CupertinoIcons.calendar,
            color: Colors.black,
          ),
          SizedBox(width: 10),
          Text(
            prettyDateToString(_selectedDay),
            style: Theme.of(context)
                .textTheme
                .headline5!
                .copyWith(color: Colors.black),
          ),
        ],
      ),
    );
  }

  void _onFloatingActionButtonPressed() async {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => AddTodoView(),
      ),
    );
  }
}
