import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_todo/view/login_cubit.dart';
import 'package:simple_todo/view/login_view.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider<LoginCubit>(
        create: (context) => LoginCubit(),
        child: const LoginView(),
      ),
    );
  }
}
