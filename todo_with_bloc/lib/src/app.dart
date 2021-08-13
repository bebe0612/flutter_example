import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:todo_with_bloc/core/bloc_observer.dart';
import 'package:todo_with_bloc/src/views/splash_view.dart';

import 'repositories/todo_repository.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Bloc.observer = SimpleBlocObserver();
    return RepositoryProvider(
      create: (context) => TodoRepository(),
      child: OverlaySupport.global(
        child: MaterialApp(
          home: SplashView(),
        ),
      ),
    );
  }
}
