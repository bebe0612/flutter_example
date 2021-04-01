import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CustomCalendar extends StatelessWidget {
  const CustomCalendar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      focusedDay: DateTime.now(),
      firstDay: DateTime.parse('2012-01-01'),
      lastDay: DateTime.parse('2030-12-30'),
      calendarFormat: CalendarFormat.twoWeeks,
      onFormatChanged: (_) {
        print("1");
      },
    );
  }
}
