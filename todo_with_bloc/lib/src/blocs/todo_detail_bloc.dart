import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todo_with_bloc/src/models/todo_model.dart';
import 'package:todo_with_bloc/src/repositories/todo_repository.dart';

part 'todo_detail_event.dart';
part 'todo_detail_state.dart';

class TodoDetailBloc extends Bloc<TodoDetailEvent, TodoDetailState> {
  final TodoRepository _todoRepository;
  TodoDetailBloc({required TodoRepository todoRepository})
      : _todoRepository = todoRepository,
        super(TodoDetailInitial());

  @override
  Stream<TodoDetailState> mapEventToState(
    TodoDetailEvent event,
  ) async* {
    if (event is TodoDetailRequested) {
      yield TodoDetailInProgress();
      try {
        var todoModel = await _todoRepository.getTodoModelById(event.todoId);

        yield TodoDetailSuccess(todoModel);
      } catch (e) {
        yield TodoDetailFail();
      }
    }
  }
}
