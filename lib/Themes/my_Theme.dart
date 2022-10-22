import 'package:flutter/material.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    primaryColor: Colors.green,
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      color: Colors.green,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(20),
        ),
      ),
    ),
  );
}
