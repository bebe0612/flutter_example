import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todo_with_bloc/core/overlay.dart';
import 'package:todo_with_bloc/src/blocs/todo_modify_bloc.dart';
import 'package:todo_with_bloc/src/models/todo_model.dart';
import 'package:todo_with_bloc/src/repositories/todo_repository.dart';

class TodoModifyView extends StatefulWidget {
  const TodoModifyView({
    Key? key,
    required this.todoModel,
  }) : super(key: key);
  final TodoModel todoModel;

  @override
  _TodoModifyViewState createState() => _TodoModifyViewState();
}

class _TodoModifyViewState extends State<TodoModifyView> {
  TextEditingController _titleTextController = TextEditingController();
  TextEditingController _subTitleTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoModifyBloc(
        context.read<TodoRepository>(),
        widget.todoModel,
        _titleTextController,
        _subTitleTextController,
      )..add(PageInitRequested()),
      child: BlocListener<TodoModifyBloc, TodoModifyState>(
        listener: (context, state) {
          if (state is TodoModifyInProgress) {
            showLoadingOverlay();
          }

          if (state is TodoModifyFail) {
            hideLoadingOverlay();
          }

          if (state is TodoModifySuccess) {
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
    return BlocBuilder<TodoModifyBloc, TodoModifyState>(
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
                  context.read<TodoModifyBloc>().add(DateChanged(a));
                },
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  controller: _titleTextController,
                  onChanged: (value) {
                    context.read<TodoModifyBloc>().add(TitleChanged(value));
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
                  controller: _subTitleTextController,
                  onChanged: (value) {
                    context.read<TodoModifyBloc>().add(SubTitleChanged(value));
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
      title: Text('Todo Modify'),
      actions: [
        BlocBuilder<TodoModifyBloc, TodoModifyState>(
          builder: (context, state) {
            return IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                context.read<TodoModifyBloc>().add(TodoModifyRequested());
              },
            );
          },
        )
      ],
    );
  }
}
