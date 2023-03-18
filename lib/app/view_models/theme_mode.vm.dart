import 'package:flutter/material.dart';
import 'package:flutter_academy/infrastructure/res/theme_mode.service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeModeVM extends ChangeNotifier {
  ThemeModeService _themeModeService;
  ThemeMode _themeMode = ThemeMode.dark;
  ThemeModeVM(this._themeModeService) {
    loadThemeMode();
  }
  ThemeMode get themeMode => _themeMode;
}

final themeModeProvider =
    ChangeNotifierProvider((_) => ThemeModeVM(ThemeModeService.instance));

Future<void> loadThemeMode() async {
  final darkTheme = await _themeModeService.isDarkMode();
  _themeMode = darkTheme ? ThemeMode.dark : ThemeMode.light;
  notifyListeners();
}
