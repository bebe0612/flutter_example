import 'package:flutter/material.dart';
import 'package:reactive_dashboard_app/core/settings/responsive.dart';
import 'package:reactive_dashboard_app/page/home/components/dash_board/header.dart';
import 'package:reactive_dashboard_app/page/home/components/dash_board/right_panel.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Header(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      Container(
                        color: Colors.amber,
                        height: 80,
                      ),
                      if (Responsive.isTablet(context)) RightPanel(),
                    ],
                  ),
                ),
                SizedBox(width: 16.0),
                if (Responsive.isDesktop(context))
                  Expanded(
                    flex: 2,
                    child: RightPanel(),
                  )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
