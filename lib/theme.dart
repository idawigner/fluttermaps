import 'package:flutter/material.dart';
import 'package:integratingmaps/constant.dart';

ThemeData theme() {
  return ThemeData(
    primaryColorLight: yPrimaryColorLight,
    primaryColor: yPrimaryColor,
    primaryColorDark: yPrimaryColorDark,
    scaffoldBackgroundColor: Colors.white,
    // appBarTheme: const AppBarTheme(
    //   backgroundColor: Colors.white,
    //   titleTextStyle: TextStyle(color: yPrimaryColor),
    // )
  );
}
