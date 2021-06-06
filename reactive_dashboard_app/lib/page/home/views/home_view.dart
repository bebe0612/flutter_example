import 'package:flutter/material.dart';
import 'package:reactive_dashboard_app/core/settings/responsive.dart';
import 'package:reactive_dashboard_app/page/home/components/dash_board/dash_board.dart';
import 'package:reactive_dashboard_app/page/home/components/side_menu.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (Responsive.isDesktop(context))
              Expanded(
                flex: 1,
                child: SideMenu(),
              ),
            Expanded(
              flex: 5,
              child: DashBoard(),
            ),
          ],
        ),
      ),
    );
  }
}
