import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_with_provider/providers/todo_provider.dart';
import 'package:todo_with_provider/utils/util.dart';
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
          _buildTodoTitle(context),
          Expanded(
            child: Scrollbar(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ...todoProvider
                        .getTodos(_selectedDay)
                        .map((e) => TodoTile(todo: e))
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

  Container _buildTodoTitle(BuildContext context) {
    return Container(
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
            prettyDateToString(_selectedDay),
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(color: Theme.of(context).primaryColor),
          ),
        ],
      ),
    );
  }

  void _onFloatingActionButtonPressed() async {
    //
  }
}
