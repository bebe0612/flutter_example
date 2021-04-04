import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_with_provider/widgets/widgets.dart';

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
          CustomCalendar(
            initialFocusedDate: DateTime.now(),
            onFocusedDateChanged: (date) {
              //
            },
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
                  "20. 04. 02",
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
                      ),
                    ),
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
