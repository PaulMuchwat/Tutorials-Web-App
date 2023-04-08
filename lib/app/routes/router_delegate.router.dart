import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_academy/app/pages/about.pages.dart';
import 'package:flutter_academy/app/pages/contact.pages.dart';
import 'package:flutter_academy/app/pages/course_details.pages.dart';
import 'package:flutter_academy/app/pages/courses.pages.dart';
import 'package:flutter_academy/app/pages/dashboard.page.dart';
import 'package:flutter_academy/app/pages/error_404.pages.dart';
import 'package:flutter_academy/app/pages/login.page.dart';
import 'package:flutter_academy/app/pages/watchlist.page.dart';
import 'package:flutter_academy/app/view_models/auth.vm.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppRouterDelegate extends RouterDelegate<Uri>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<Uri> {
  @override
  final GlobalKey<NavigatorState> navigatorKey;

  Uri _path = Uri.parse('/');

  AppRouterDelegate() : navigatorKey = GlobalKey<NavigatorState>();

  @override
  Uri get currentConfiguration => _path;

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final pages = _getRoutes(_path, ref.watch(authVM));
      return Navigator(
        key: navigatorKey,
        pages: pages,
        onPopPage: (route, result) {
          if (!route.didPop(result)) {
            return false;
          }

          if (pages.isNotEmpty) {
            _path = _path.replace(
                pathSegments: _path.pathSegments
                    .getRange(0, _path.pathSegments.length - 1));
            _safeNotifyListeners();
            return true;
          }
          return false;
        },
      );
    });
  }

  @override
  Future<void> setNewRoutePath(Uri configuration) async =>
      go(configuration.toString());

  go(String path) {
    _path = Uri.parse(path);
    _safeNotifyListeners();
  }

  List<Page> _getRoutes(Uri path, AuthVM authVM) {
    final pages = <Page>[];

    pages
        .add(const MaterialPage(child: DashboardPage(), key: ValueKey('home')));

    if (path.pathSegments.isEmpty) {
      return pages;
    }
    switch (path.pathSegments[0]) {
      case 'contact':
        pages.add(const MaterialPage(
          key: ValueKey('contact'),
          child: ContactPage(),
        ));
        break;
      case 'about':
        pages.add(const MaterialPage(
          key: ValueKey('about'),
          child: AboutPage(),
        ));
        break;
      case 'courses':
        pages.add(const MaterialPage(
          key: ValueKey('courses'),
          child: CoursesPage(),
        ));
        break;
      case 'watchlist':
        pages.add(const MaterialPage(
          child: WatchlistPage(),
          key: ValueKey('watchlist'),
        ));
        break;
      case 'login':
        if (authVM.isLoggedIn) {
          go('/');
          break;
        }
        pages.add(const MaterialPage(
          key: ValueKey('login'),
          child: LoginPage(),
        ));
        break;
      default:
        pages.add(
            const MaterialPage(child: Error404Page(), key: ValueKey('error')));
        break;
    }
    if (path.pathSegments.length == 2) {
      if (path.pathSegments[0] == 'courses') {
        pages.add(
          MaterialPage(
            key: ValueKey('course.${path.pathSegments[1]}'),
            child: CourseDetailsPage(
              courseId: int.parse(
                path.pathSegments[1],
              ),
            ),
          ),
        );
      } else {
        pages.add(
            const MaterialPage(child: Error404Page(), key: ValueKey('error')));
      }
    }
    return pages;
  }

  void _safeNotifyListeners() {
    // this is a hack to fix the following error:
    // The following assertion was thrown while dispatching notifications for
    // GoRouterDelegate: setState() or markNeedsBuild() called during build.
    // ignore: unnecessary_null_comparison
    WidgetsBinding.instance == null
        ? notifyListeners()
        : scheduleMicrotask(notifyListeners);
  }
}
