import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

/// # CustomCalendar
/// This widget is custom of `TableCalendar`
///
class CustomCalendar extends StatefulWidget {
  const CustomCalendar({
    Key? key,
    @required this.initialFocusedDate,
    @required this.onFocusedDateChanged,
  }) : super(key: key);
  final DateTime? initialFocusedDate;
  final Function(DateTime date)? onFocusedDateChanged;
  @override
  _CustomCalendarState createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {
  CalendarFormat _currentCalendarFormat = CalendarFormat.month;

  DateTime _focusedDay = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      calendarStyle: CalendarStyle(
          selectedDecoration: BoxDecoration(
        color: Colors.blue,
      )),
      focusedDay: _focusedDay,
      firstDay: DateTime.parse('2012-01-01'),
      lastDay: DateTime.parse('2030-12-30'),
      calendarFormat: _currentCalendarFormat,
      onDaySelected: (day, _) {
        setState(() {
          _focusedDay = day;
        });
      },
      onFormatChanged: (format) {
        setState(() {
          _currentCalendarFormat = format;
        });
      },
    );
  }
}
