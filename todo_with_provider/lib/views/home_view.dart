import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
          TableCalendar(
            focusedDay: DateTime.now(),
            firstDay: DateTime.parse('2012-01-01'),
            lastDay: DateTime.parse('2030-12-30'),
          ),
          Divider(),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              "20. 04. 02",
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          ListTile(
              title: Text(
                "Morning exercise",
                style: Theme.of(context).textTheme.subtitle1,
              ),
              subtitle: Text(
                "drying, washing",
                style: Theme.of(context).textTheme.bodyText2,
              ),
              leading: AspectRatio(
                aspectRatio: 1,
                child: Center(
                  child: Icon(
                    Icons.check_box,
                  ),
                ),
              ))
        ],
      ),
    );
  }

  void _onFloatingActionButtonPressed() async {
    //
  }
}
