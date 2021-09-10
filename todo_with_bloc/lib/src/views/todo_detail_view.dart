import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_with_bloc/src/blocs/todo_detail_bloc.dart';
import 'package:todo_with_bloc/src/repositories/todo_repository.dart';

class TodoDetailView extends StatelessWidget {
  const TodoDetailView({
    Key? key,
    required this.todoId,
  }) : super(key: key);
  final int todoId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoDetailBloc(
        todoRepository: context.read<TodoRepository>(),
      )..add(TodoDetailRequested(todoId: todoId)),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Detail'),
        ),
        body: _body(),
      ),
    );
  }

  Widget _body() {
    return BlocBuilder<TodoDetailBloc, TodoDetailState>(
      builder: (context, state) {
        if (state is TodoDetailInProgress) {
          return Center(
            child: CupertinoActivityIndicator(),
          );
        } else if (state is TodoDetailSuccess) {
          final todo = state.todoModel;
          return Column(
            children: [
              Text(todo.title),
              Text(todo.subTitle),
              Text(todo.date.toString()),
            ],
          );
        }
        return Column(
          children: [
            //
          ],
        );
      },
    );
  }
}
