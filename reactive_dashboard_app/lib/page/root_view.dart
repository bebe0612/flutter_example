import 'package:flutter/material.dart';

class RootView extends StatelessWidget {
  const RootView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size);
    return Stack(
      children: [
        Container(
          child: Row(
            children: [
              Container(
                color: Colors.red,
                constraints: BoxConstraints(
                  minWidth: 80,
                  maxWidth: 100,
                ),
              ),
              Expanded(
                flex: 4,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: 2500,
                        color: Colors.blue,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  color: Colors.yellow,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
