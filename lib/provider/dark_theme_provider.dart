import 'package:course_firebase_app/models/dark_theme_preferences.dart';
import 'package:flutter/material.dart';

class DarkThemeProvider with ChangeNotifier {
  DarkThemePreferences prefs = DarkThemePreferences();
  bool _darkTheme = false;

  bool get darkTheme => _darkTheme;

  set darkTheme(bool value) {
    _darkTheme = value;
    prefs.setTheme(_darkTheme);
    notifyListeners();
  }
}
