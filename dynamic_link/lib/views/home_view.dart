import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => null,
      ),
      body: Center(
        child: Text("Home"),
      ),
    );
  }
}
