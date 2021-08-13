import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todo_with_bloc/core/overlay.dart';
import 'package:todo_with_bloc/src/blocs/todo_add_bloc.dart';
import 'package:todo_with_bloc/src/repositories/todo_repository.dart';

class TodoAddView extends StatelessWidget {
  const TodoAddView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoAddBloc(context.read<TodoRepository>()),
      child: BlocListener<TodoAddBloc, TodoAddState>(
        listener: (context, state) {
          if (state is TodoAddInProgress) {
            showLoadingOverlay();
          }

          if (state is TodoAddFail) {
            hideLoadingOverlay();
          }

          if (state is TodoAddSuccess) {
            hideLoadingOverlay();
            Navigator.of(context).pop();
          }
        },
        child: Scaffold(
          appBar: _appBar(),
          body: _body(),
        ),
      ),
    );
  }

  Widget _body() {
    return BlocBuilder<TodoAddBloc, TodoAddState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            children: [
              TableCalendar(
                focusedDay: state.form.dateTime,
                firstDay: DateTime.parse('2020-01-01'),
                lastDay: DateTime.parse('2030-12-31'),
                currentDay: state.form.dateTime,
                onDaySelected: (a, _) {
                  context.read<TodoAddBloc>().add(DateTimeChanged(a));
                },
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  onChanged: (value) {
                    context.read<TodoAddBloc>().add(TitleChanged(value));
                  },
                  textDirection: TextDirection.rtl,
                  onEditingComplete: () {
                    FocusScope.of(context).nextFocus();
                  },
                  decoration: InputDecoration(
                    prefixIcon: Text('Title'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  onChanged: (value) {
                    context.read<TodoAddBloc>().add(SubTitleChanged(value));
                  },
                  textDirection: TextDirection.rtl,
                  decoration: InputDecoration(
                    prefixIcon: Text('SubTitle'),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: Text('Todo Add'),
      actions: [
        BlocBuilder<TodoAddBloc, TodoAddState>(
          builder: (context, state) {
            return IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                context.read<TodoAddBloc>().add(TodoAddRequested());
              },
            );
          },
        )
      ],
    );
  }
}
