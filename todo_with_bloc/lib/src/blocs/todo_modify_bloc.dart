import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:todo_with_bloc/src/models/todo_add_form.dart';
import 'package:todo_with_bloc/src/models/todo_model.dart';
import 'package:todo_with_bloc/src/repositories/todo_repository.dart';

part 'todo_modify_event.dart';
part 'todo_modify_state.dart';

class TodoModifyBloc extends Bloc<TodoModifyEvent, TodoModifyState> {
  final TodoRepository _todoRepository;
  final TextEditingController _titleTextController;
  final TextEditingController _subTitleTextController;
  final TodoModel todoModel;
  TodoModifyBloc(
    TodoRepository todoRepository,
    this.todoModel,
    TextEditingController titleTextController,
    TextEditingController subTitleTextController,
  )   : _todoRepository = todoRepository,
        _titleTextController = titleTextController,
        _subTitleTextController = subTitleTextController,
        super(TodoModifyInitial(
          TodoAddForm(
            dateTime: todoModel.date,
            subTitle: todoModel.subTitle,
            title: todoModel.title,
          ),
        )) {}

  @override
  Stream<TodoModifyState> mapEventToState(
    TodoModifyEvent event,
  ) async* {
    if (event is PageInitRequested) {
      _titleTextController.text = todoModel.title;
      _subTitleTextController.text = todoModel.subTitle;
    }

    if (event is TitleChanged) {
      yield TodoModifyInitial(state.form.copyWith(title: event.value));
    }
    if (event is SubTitleChanged) {
      yield TodoModifyInitial(state.form.copyWith(subTitle: event.value));
    }
    if (event is DateChanged) {
      yield TodoModifyInitial(state.form.copyWith(dateTime: event.value));
    }

    if (event is TodoModifyRequested) {
      yield TodoModifyInProgress(state.form);

      try {
        await _todoRepository.modifyTodo(todoModel.id, state.form);
        yield TodoModifySuccess(state.form);
      } catch (e) {
        yield TodoModifyFail(state.form);
      }
    }
  }
}
