import 'package:flutter/material.dart';
import 'package:flutter_academy/app/res/responsive.res.dart';
import 'package:flutter_academy/app/widgets/drawer_nav.widget.dart';
import 'package:flutter_academy/app/widgets/top_nav.widget.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: const <Widget>[
          TopNav(),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Contact Page"),
          )
        ],
      ),
      drawer: MediaQuery.of(context).size.width > ScreenSizes.md
          ? null
          : const DrawerNav(),
    );
  }
}
