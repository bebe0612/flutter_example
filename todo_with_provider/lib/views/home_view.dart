import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo App With Provider"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _onFloatingActionButtonPressed,
      ),
      body: Column(
        children: [
          ListTile(
              title: Text("아침에 할일"),
              subtitle: Text("빨래 정리하고 출근 준비하기"),
              leading: AspectRatio(
                aspectRatio: 1,
                child: Center(
                  child: Icon(
                    Icons.check_box,
                  ),
                ),
              ))
        ],
      ),
    );
  }

  void _onFloatingActionButtonPressed() async {
    //
  }
}
