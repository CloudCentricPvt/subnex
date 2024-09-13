import 'package:flutter/material.dart';

import '../constants/k_colors.dart';

class KElevatedButtonTheme {
  KElevatedButtonTheme._();

  static ElevatedButtonThemeData kElevatedButtonThemeLight =
      ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
    elevation: 0,
    foregroundColor: Colors.white,
    backgroundColor: KColors.appPrimary,
    disabledBackgroundColor: Colors.grey,
    disabledForegroundColor: Colors.grey,
   // side: BorderSide(color: KColors.appPrimary),
    padding: EdgeInsets.symmetric(vertical: 18),
    textStyle: TextStyle(
        fontSize: 16.0, color: Colors.white, fontWeight: FontWeight.w600),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0))
  ));

  static ElevatedButtonThemeData kElevatedButtonThemeDark =
      ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
    elevation: 0,
    foregroundColor: Colors.white,
    backgroundColor: KColors.appPrimary,
    disabledBackgroundColor: Colors.grey,
    disabledForegroundColor: Colors.grey,
    side: BorderSide(color: KColors.appPrimary),
    padding: EdgeInsets.symmetric(vertical: 18),
    textStyle: TextStyle(
        fontSize: 16.0, color: Colors.white, fontWeight: FontWeight.w600),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0))
  ));
}
