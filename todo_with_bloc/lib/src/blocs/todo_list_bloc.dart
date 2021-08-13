import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todo_with_bloc/src/models/todo_model.dart';
import 'package:todo_with_bloc/src/repositories/todo_repository.dart';

part 'todo_list_event.dart';
part 'todo_list_state.dart';

class TodoListBloc extends Bloc<TodoListEvent, TodoListState> {
  final TodoRepository _todoRepository;
  TodoListBloc(TodoRepository todoRepository)
      : _todoRepository = todoRepository,
        super(TodoListInitial()) {
    _todoRepository.onTodoChanged.listen((event) {
      add(TodoListRequested());
    });
  }

  @override
  Stream<TodoListState> mapEventToState(
    TodoListEvent event,
  ) async* {
    if (event is TodoListRequested) {
      yield TodoListInProgress();

      try {
        List<TodoModel> todoList = await _todoRepository.getTodoList();

        yield TodoListSuccess(todoList);
      } catch (e) {
        yield TodoListFail();
      }
    }
  }
}
