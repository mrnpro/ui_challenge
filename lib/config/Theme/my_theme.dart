import 'package:flutter/material.dart';

import '../palette.dart';

class MyTheme {
  static final ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
        background: MyColorPalette.kPrimaryColor,
        seedColor: MyColorPalette.kPrimaryColor),
    useMaterial3: true,
  );
}
