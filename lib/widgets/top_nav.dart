import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_academy/res/responsive.dart';

class TopNav extends StatelessWidget {
  const TopNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Flutter Academy'),
      elevation: kIsWeb ? 0 : null,
      centerTitle: kIsWeb ? false : null,
      actions: (MediaQuery.of(context).size.width <= ScreenSizes.md)
          ? null
          : [
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed("/");
                },
                child: const Text("Home"),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed("courses");
                },
                child: const Text("Courses"),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed("about");
                },
                child: const Text("About"),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed("contact");
                },
                child: const Text("Contact"),
              ),
            ],
    );
  }
}
