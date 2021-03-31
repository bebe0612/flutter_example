import 'package:flutter/material.dart';
import 'package:todo_with_provider/views/home_view.dart';

class SplashView extends StatefulWidget {
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    _initData();

    super.initState();
  }

  void _initData() async {
    await Future.delayed(Duration(milliseconds: 2000));
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (_) => HomeView()));
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Text("Splash"),
      ),
    );
  }
}
