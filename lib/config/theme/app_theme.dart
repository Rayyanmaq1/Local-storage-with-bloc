import 'package:flutter/material.dart';
import 'package:movie_db/core/constants/constants.dart';
import 'package:movie_db/config/theme/app_colors.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: kLightWhightColor,
    fontFamily: kFontFamily,
    appBarTheme: appBarTheme(),
  );
}

AppBarTheme appBarTheme() {
  return const AppBarTheme(
      color: Colors.white,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.black));
}
