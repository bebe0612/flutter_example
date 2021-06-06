import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.blue[800],
        child: SingleChildScrollView(
          child: Column(
            children: [
              DrawerHeader(
                child: Container(
                  color: Colors.white,
                ),
              ),
              DrawerListTile(
                title: "Dashbord",
                iconData: Icons.settings,
                onPressed: () {},
              ),
              DrawerListTile(
                title: "Transaction",
                iconData: Icons.settings,
                onPressed: () {},
              ),
              DrawerListTile(
                title: "Task",
                iconData: Icons.settings,
                onPressed: () {},
              ),
              DrawerListTile(
                title: "Documents",
                iconData: Icons.settings,
                onPressed: () {},
              ),
              DrawerListTile(
                title: "Store",
                iconData: Icons.settings,
                onPressed: () {},
              ),
              DrawerListTile(
                title: "Notification",
                iconData: Icons.settings,
                onPressed: () {},
              ),
              DrawerListTile(
                title: "Profile",
                iconData: Icons.settings,
                onPressed: () {},
              ),
              DrawerListTile(
                title: "Settings",
                iconData: Icons.settings,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    required this.title,
    required this.iconData,
    required this.onPressed,
  }) : super(key: key);

  final String title;

  final IconData iconData;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {},
        child: Container(
          height: 45,
          padding: EdgeInsets.symmetric(vertical: 10),
          color: Colors.transparent,
          child: Row(
            children: [
              SizedBox(width: 10),
              Icon(
                iconData,
                color: Colors.white54,
              ),
              SizedBox(width: 10),
              Text(
                title,
                style: TextStyle(color: Colors.white70),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
