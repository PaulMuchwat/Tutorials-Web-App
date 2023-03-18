import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_academy/app/view_models/theme_mode.vm.dart';
import 'package:flutter_academy/main.dart';
import 'package:flutter_academy/app/res/responsive.res.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
                  routerDelegate.go('/');
                },
                child: const Text("Home"),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  routerDelegate.go('/courses');
                },
                child: const Text("Courses"),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  routerDelegate.go('/about');
                },
                child: const Text("About"),
              ),
              TextButton(
                onPressed: () {
                  routerDelegate.go('/watchlist');
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                ),
                child: const Text("Watchlist"),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  routerDelegate.go('/login');
                },
                child: const Text("Login"),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  routerDelegate.go('/contact');
                },
                child: const Text("Contact"),
              ),
              Consumer(builder: (context, ref, child) {
                final themeModeVM = ref.watch(themeModeProvider);
                return TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    themeModeVM.toggleThemeMode();
                  },
                  child: Text(themeModeVM.themeMode == ThemeMode.dark
                      ? "Light Theme"
                      : "Dark Theme"),
                );
              })
            ],
    );
  }
}
