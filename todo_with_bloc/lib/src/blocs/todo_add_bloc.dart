import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todo_with_bloc/src/models/todo_add_form.dart';
import 'package:todo_with_bloc/src/repositories/todo_repository.dart';

part 'todo_add_event.dart';
part 'todo_add_state.dart';

class TodoAddBloc extends Bloc<TodoAddEvent, TodoAddState> {
  final TodoRepository _todoRepository;
  TodoAddBloc(TodoRepository todoRepository)
      : _todoRepository = todoRepository,
        super(TodoAddInitial(
            TodoAddForm(title: '', subTitle: '', dateTime: DateTime.now())));

  @override
  Stream<TodoAddState> mapEventToState(
    TodoAddEvent event,
  ) async* {
    if (event is TitleChanged) {
      yield TodoAddInitial(state.form.copyWith(title: event.value));
    }

    if (event is SubTitleChanged) {
      yield TodoAddInitial(state.form.copyWith(subTitle: event.value));
    }

    if (event is DateTimeChanged) {
      yield TodoAddInitial(state.form.copyWith(dateTime: event.value));
    }

    if (event is TodoAddRequested) {
      yield TodoAddInProgress(state.form);

      try {
        await _todoRepository.addTodo(state.form);
        yield TodoAddSuccess(state.form);
      } catch (e) {
        yield TodoAddFail(state.form);
      }
    }
  }
}
