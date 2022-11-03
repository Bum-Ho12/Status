import 'package:flutter/material.dart';

// import 'storage_manager.dart';

class ThemeClass {
  static ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: Colors.white,
      colorScheme: const ColorScheme.light(),
      iconTheme: const IconThemeData(color: Colors.white),
      appBarTheme: const AppBarTheme(
        centerTitle: false,
        elevation: 0,
        toolbarHeight: 120,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Color(0xfF25D366), size: 15),
        actionsIconTheme: IconThemeData(color: Color(0xfF128C7E), size: 35),
        titleTextStyle: TextStyle(
            color: Color(0xfF25D366),
            fontSize: 24,
            fontWeight: FontWeight.w500),
      ),
      hoverColor: const Color(0xffD3D3D3),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          hoverElevation: 5, splashColor: Color(0xfF128C7E)),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: Color(0xfF128C7E),
      ),
      buttonTheme: const ButtonThemeData(
          hoverColor: Color(0xfF25D366), buttonColor: Color(0xfF128C7E)));

  static ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: const Color(0xFF343434),
      colorScheme: const ColorScheme.dark(),
      iconTheme: const IconThemeData(color: Colors.white),
      appBarTheme: const AppBarTheme(
        centerTitle: false,
        elevation: 0,
        toolbarHeight: 120,
        backgroundColor: Color(0xFF343434),
        iconTheme: IconThemeData(color: Color(0xfF128C7E)),
        actionsIconTheme: IconThemeData(color: Color(0xfF128C7E), size: 35),
        titleTextStyle: TextStyle(
            color: Color(0xfF128C7E),
            fontSize: 24,
            fontWeight: FontWeight.w500),
      ),
      hoverColor: const Color(0xff71797E),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          hoverElevation: 5, splashColor: Color(0xfF128C7E)),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: Color(0xfF128C7E),
      ),
      buttonTheme: const ButtonThemeData(
          hoverColor: Color(0xfF25D366), buttonColor: Color(0xfF128C7E)));
}
