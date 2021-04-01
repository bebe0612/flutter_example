import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

/// # CustomCalendar
/// This widget is custom of `TableCalendar`
///
class CustomCalendar extends StatefulWidget {
  const CustomCalendar({
    Key? key,
  }) : super(key: key);

  @override
  _CustomCalendarState createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {
  CalendarFormat _currentCalendarFormat = CalendarFormat.month;

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      focusedDay: DateTime.now(),
      firstDay: DateTime.parse('2012-01-01'),
      lastDay: DateTime.parse('2030-12-30'),
      calendarFormat: _currentCalendarFormat,
      onFormatChanged: (format) {
        setState(() {
          _currentCalendarFormat = format;
        });
      },
    );
  }
}
