import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_with_bloc/core/settings/app_font.dart';
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
        backgroundColor: Colors.blueGrey,
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
              SafeArea(bottom: false, child: Container()),
              Text(
                'Double tap to exit',
                style: AppFont.p1.copyWith(color: Colors.white),
              ),
              Spacer(),
              Text(
                todo.title,
                style: AppFont.h1.copyWith(color: Colors.white),
              ),
              Text(
                todo.subTitle,
                style: AppFont.p1.copyWith(color: Colors.white),
              ),
              Spacer(),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 26),
                      child: CupertinoButton.filled(
                          child: Text('DONE', style: AppFont.p1),
                          onPressed: () {},
                          borderRadius: BorderRadius.circular(30.0),
                          padding: EdgeInsets.symmetric(
                              horizontal: 25.0, vertical: 15.0)),
                    ),
                  ),
                ],
              ),
              SafeArea(top: false, child: Container()),
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
