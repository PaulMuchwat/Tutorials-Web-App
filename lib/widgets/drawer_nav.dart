import 'package:flutter/material.dart';

class DrawerNav extends StatelessWidget {
  const DrawerNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            color: Theme.of(context).primaryColor,
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Flutter Academy",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: Colors.white),
            ),
          ),
          ListTile(
            title: const Text("Home"),
            onTap: () {},
          ),
          ListTile(
            title: const Text("Courses"),
            onTap: () {},
          ),
          ListTile(
            title: const Text("About"),
            onTap: () {},
          ),
          ListTile(
            title: const Text("Contact"),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
