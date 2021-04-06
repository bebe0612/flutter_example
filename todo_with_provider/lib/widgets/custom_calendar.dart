import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

/// # CustomCalendar
/// This widget is custom of `TableCalendar`
///
class CustomCalendar extends StatefulWidget {
  const CustomCalendar({
    Key? key,
    @required this.initialSelectedDay,
    @required this.selectedDay,
    @required this.onDaySelected,
  }) : super(key: key);
  final DateTime? initialSelectedDay;
  final DateTime? selectedDay;

  final Function(DateTime date)? onDaySelected;
  @override
  _CustomCalendarState createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {
  CalendarFormat _currentCalendarFormat = CalendarFormat.month;

  DateTime? _focusedDay;
  DateTime? _selectedDay;

  @override
  void initState() {
    _focusedDay = widget.initialSelectedDay!;
    _selectedDay = widget.initialSelectedDay!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      selectedDayPredicate: (day) => day == widget.selectedDay,
      focusedDay: _focusedDay!,
      firstDay: DateTime.parse('2012-01-01'),
      lastDay: DateTime.parse('2030-12-30'),
      calendarFormat: _currentCalendarFormat,
      onDaySelected: (selectedDay, focusedDay) {
        widget.onDaySelected!(selectedDay);
      },
      onFormatChanged: (format) {
        setState(() {
          _currentCalendarFormat = format;
        });
      },
    );
  }
}
