import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_with_provider/providers/todo_provider.dart';
import 'package:todo_with_provider/views/splash_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TodoProvider(),
      child: MaterialApp(
        title: 'Todo With Provider',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SplashView(),
      ),
    );
  }
}
