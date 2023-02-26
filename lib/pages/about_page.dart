import 'package:flutter/material.dart';
import 'package:flutter_academy/res/responsive.dart';
import 'package:flutter_academy/widgets/drawer_nav.dart';
import 'package:flutter_academy/widgets/top_nav.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: const <Widget>[
          TopNav(),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("About Page"),
          )
        ],
      ),
      drawer: MediaQuery.of(context).size.width > ScreenSizes.md
          ? null
          : const DrawerNav(),
    );
  }
}
