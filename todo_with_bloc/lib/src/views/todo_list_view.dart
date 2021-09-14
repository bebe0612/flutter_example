import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_with_bloc/src/blocs/todo_list_bloc.dart';
import 'package:todo_with_bloc/src/repositories/todo_repository.dart';
import 'package:todo_with_bloc/src/views/todo_add_view.dart';
import 'package:todo_with_bloc/src/views/todo_detail_view.dart';

class TodoListView extends StatelessWidget {
  const TodoListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoListBloc(context.read<TodoRepository>())
        ..add(TodoListRequested()),
      child: Scaffold(
        appBar: AppBar(title: Text("Todo List")),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => TodoAddView()));
          },
        ),
        body: _body(),
      ),
    );
  }

  Widget _body() {
    return BlocBuilder<TodoListBloc, TodoListState>(
      builder: (context, state) {
        if (state is TodoListInProgress) {
          return Center(child: CircularProgressIndicator());
        }

        if (state is TodoListSuccess) {
          return Column(
            children: [
              ...state.todoList
                  .map(
                    (e) => ListTile(
                      title: Text(e.title),
                      subtitle: Text(e.subTitle),
                      trailing: IconButton(
                          onPressed: () {
                            showCupertinoModalPopup(
                              context: context,
                              builder: (_context) {
                                return CupertinoActionSheet(
                                  actions: [
                                    CupertinoActionSheetAction(
                                      onPressed: () {
                                        Navigator.of(_context).pop();
                                      },
                                      child: Text('Modify'),
                                    ),
                                    CupertinoActionSheetAction(
                                      onPressed: () {
                                        context
                                            .read<TodoListBloc>()
                                            .add(RemoveTodoRequested(e.id));
                                        Navigator.of(_context).pop();
                                      },
                                      child: Text('Remove'),
                                    ),
                                  ],
                                  cancelButton: CupertinoActionSheetAction(
                                    onPressed: () {
                                      Navigator.of(_context).pop();
                                    },
                                    child: Text('Close'),
                                    isDestructiveAction: true,
                                  ),
                                );
                              },
                            );
                          },
                          icon: Icon(CupertinoIcons.ellipsis)),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => TodoDetailView(
                                  todoId: e.id,
                                )));
                      },
                    ),
                  )
                  .toList()
            ],
          );
        }

        if (state is TodoListFail) {
          return Container();
        }

        return Container();
      },
    );
  }
}
