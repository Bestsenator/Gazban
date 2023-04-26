import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  late ThemeMode themeMode = ThemeMode.system;

  ThemeProvider() {
    readTheme();
  }

  readTheme() async {
    final prefs = await SharedPreferences.getInstance();

    final String theme = prefs.getString('theme') ?? 'system';

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
    dialogTheme:
        DialogTheme(backgroundColor: Colors.grey.shade900, elevation: 4),
    canvasColor: Colors.grey.shade800,
    snackBarTheme: const SnackBarThemeData(
        contentTextStyle: TextStyle(fontFamily: 'Mikhak')),
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: TextStyle(color: Colors.white.withOpacity(0.8)),
      floatingLabelStyle: const TextStyle(color: Colors.white),
      helperStyle: const TextStyle(color: Colors.white),
      hintStyle: const TextStyle(color: Colors.white),
      errorStyle: const TextStyle(color: Colors.red),
      enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(20)),
      border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white, width: 1.5),
          borderRadius: BorderRadius.circular(20)),
      focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 1.5),
          borderRadius: BorderRadius.circular(20)),
      errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 1.5),
          borderRadius: BorderRadius.circular(20)),
      disabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey, width: 1.5),
          borderRadius: BorderRadius.circular(20)),
      focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 1.5),
          borderRadius: BorderRadius.circular(20)),
    ),
    bottomSheetTheme:
        BottomSheetThemeData(backgroundColor: Colors.grey.shade900),
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
    dialogTheme: const DialogTheme(backgroundColor: Colors.white, elevation: 4),
    snackBarTheme: const SnackBarThemeData(
        contentTextStyle: TextStyle(fontFamily: 'Mikhak')),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black45, width: 1),
          borderRadius: BorderRadius.circular(20)),
      border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey, width: 1.5),
          borderRadius: BorderRadius.circular(20)),
      focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 1.5),
          borderRadius: BorderRadius.circular(20)),
      errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 1.5),
          borderRadius: BorderRadius.circular(20)),
      disabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black12, width: 1.5),
          borderRadius: BorderRadius.circular(20)),
      focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 1.5),
          borderRadius: BorderRadius.circular(20)),
    ),
  );
}
