import 'package:flutter/material.dart';

class DataDetailView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data detail"),
        backgroundColor: Colors.red[300],
      ),
      body: Center(
        child: Text("Data Received : "),
      ),
    );
  }
}
