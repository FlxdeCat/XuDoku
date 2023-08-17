import 'package:flutter/material.dart';

export 'package:xudoku/theme/theme.dart' show lightThemeMode, darkthemeMode;

final ThemeData lightThemeMode = ThemeData.light().copyWith(
  appBarTheme: const AppBarTheme(color: Colors.purple),
  elevatedButtonTheme: ElevatedButtonThemeData(style: ElevatedButton.styleFrom(backgroundColor: Colors.purple)),
  tabBarTheme: const TabBarTheme(
    indicator: UnderlineTabIndicator(
      borderSide: BorderSide(width: 2, color: Colors.pinkAccent)
    )
  )
);

final ThemeData darkthemeMode = ThemeData.dark().copyWith(
  appBarTheme: const AppBarTheme(color: Colors.purple),
  elevatedButtonTheme: ElevatedButtonThemeData(style: ElevatedButton.styleFrom(backgroundColor: Colors.purple)),
  tabBarTheme: const TabBarTheme(
    indicator: UnderlineTabIndicator(
      borderSide: BorderSide(width: 2, color: Colors.pinkAccent)
    )
  )
);

class ThemeChanger extends ChangeNotifier {
  ThemeMode _theme = ThemeMode.light;

  ThemeMode get themeMode => _theme;

  void changeTheme() {
    _theme = _theme == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
  }
}
