import 'package:course_firebase_app/screens/inner_screens/brand_navigation_rail.dart';

import './constants/theme_data.dart';
import './provider/dark_theme_provider.dart';
import './screens/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider darkThemeProvider = DarkThemeProvider();

  void getCurrentAppTheme() async {
    darkThemeProvider.darkTheme = await darkThemeProvider.prefs.getTheme();
  }

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => darkThemeProvider),
      ],
      child: Consumer<DarkThemeProvider>(
        builder: (ctx, themeData, widget) {
          return MaterialApp(
            title: 'Shopping App',
            theme: Styles.themeData(themeData.darkTheme, context),
            home: BottomBarScreen(),
            routes: {
              BrandNavigationRailScreen.routeName: (_) => BrandNavigationRailScreen(),
            },
          );
        },
      ),
    );
  }
}
