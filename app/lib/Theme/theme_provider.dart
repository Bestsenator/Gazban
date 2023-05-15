import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  //TODO: تم پیش فرض از اینجا مشخص میشه
  late ThemeMode themeMode = ThemeMode.dark;

  ThemeProvider() {
    readTheme();
  }

  readTheme() async {
    final prefs = await SharedPreferences.getInstance();

    //TODO: خوندن تم از حافظه از اینجاست و مدیریت پیشفرض انتخاب کردن هم میتونه از اینجا باشه

    final String theme = prefs.getString('theme') ?? 'dark';

    if (theme == 'system') {
      toggleTheme(ThemeMode.system);
    }
    if (theme == 'light') {
      toggleTheme(ThemeMode.light);
    }
    if (theme == 'dark') {
      toggleTheme(ThemeMode.dark);
    }

    return theme;
  }

  bool isDark() {
    if (themeMode == ThemeMode.dark) {
      return true;
    } else {
      return false;
    }
  }

  void toggleTheme(ThemeMode theme) {
    themeMode = theme;
    notifyListeners();
  }
}

class MyThemes {
  static final darkTheme = ThemeData(
    fontFamily: 'IRANSans',
    listTileTheme: const ListTileThemeData(
        iconColor: Colors.white, textColor: Colors.white),
    textTheme: const TextTheme(
      displayLarge: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      displayMedium: TextStyle(color: Colors.white),
      displaySmall: TextStyle(color: Colors.white),
      headlineMedium: TextStyle(color: Colors.white),
      headlineSmall: TextStyle(color: Colors.white),
      titleLarge: TextStyle(color: Colors.white),
      titleMedium: TextStyle(color: Colors.white),
      titleSmall: TextStyle(color: Colors.white),
      bodyLarge: TextStyle(color: Colors.white),
      bodyMedium: TextStyle(color: Colors.white),
      bodySmall: TextStyle(color: Colors.white),
      labelLarge: TextStyle(color: Colors.white),
      labelSmall: TextStyle(color: Colors.white),
    ),
    dividerColor: Colors.white12,
    unselectedWidgetColor: Colors.white70,
    shadowColor: const Color.fromARGB(255, 255, 255, 255),
    scaffoldBackgroundColor: Colors.grey.shade900,
    primarySwatch: Colors.red,
    secondaryHeaderColor: Colors.white,
    iconTheme: const IconThemeData(color: Colors.white, opacity: 0.8),
    dialogTheme: DialogTheme(
        backgroundColor: Colors.grey.shade900.withOpacity(0.9), elevation: 4),
    canvasColor: Colors.grey.shade800,
    snackBarTheme: const SnackBarThemeData(
        contentTextStyle: TextStyle(fontFamily: 'Mikhak')),
    bottomSheetTheme:
        BottomSheetThemeData(backgroundColor: Colors.grey.shade900),
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: TextStyle(color: Colors.white.withOpacity(0.8)),
      floatingLabelStyle: const TextStyle(color: Colors.white),
      helperStyle: const TextStyle(color: Colors.white),
      hintStyle: const TextStyle(color: Colors.white),
      errorStyle: const TextStyle(color: Colors.red),
    ),
  );

  static final lightTheme = ThemeData(
    fontFamily: 'IRANSans',
    listTileTheme: const ListTileThemeData(iconColor: Colors.black),
    textTheme: const TextTheme(
      titleLarge: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      bodySmall: TextStyle(color: Colors.black),
      labelSmall: TextStyle(color: Colors.black38),
      titleSmall: TextStyle(color: Colors.black),
      displayLarge: TextStyle(color: Colors.black),
      displayMedium: TextStyle(color: Color.fromRGBO(0, 0, 0, 1)),
      displaySmall: TextStyle(color: Colors.black),
      headlineLarge: TextStyle(color: Colors.black),
      headlineMedium: TextStyle(color: Colors.black),
      headlineSmall: TextStyle(color: Colors.black),
      labelLarge: TextStyle(color: Colors.black),
      labelMedium: TextStyle(color: Colors.black),
      titleMedium: TextStyle(color: Colors.black),
    ),
    dividerColor: Colors.black12,
    unselectedWidgetColor: Colors.black,
    primaryColorLight: Colors.white,
    scaffoldBackgroundColor: const Color.fromARGB(255, 238, 239, 232),
    primarySwatch: Colors.red,
    secondaryHeaderColor: Colors.black,
    iconTheme: const IconThemeData(color: Colors.black, opacity: 0.8),
    dialogTheme: DialogTheme(
        backgroundColor: Colors.white.withOpacity(0.9), elevation: 4),
    snackBarTheme: const SnackBarThemeData(
        contentTextStyle: TextStyle(fontFamily: 'Mikhak')),
    inputDecorationTheme: InputDecorationTheme(),
  );
}
