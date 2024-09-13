import 'package:flutter/material.dart';

import '../constants/k_colors.dart';

class KChipTheme{
  KChipTheme._();

  static ChipThemeData lightChipTheme = ChipThemeData(
    disabledColor: Colors.grey.withOpacity(0.4),
    checkmarkColor: Colors.white,
    selectedColor: KColors.appPrimary,
    labelStyle: TextStyle(color: Colors.black),
    padding: EdgeInsets.symmetric(horizontal: 12.0,vertical: 12.0),
  );

  static ChipThemeData darkChipTheme = ChipThemeData(
    disabledColor: Colors.grey,
    checkmarkColor: Colors.white,
    selectedColor: KColors.appPrimary,
    labelStyle: TextStyle(color: Colors.white),
    padding: EdgeInsets.symmetric(horizontal: 12.0,vertical: 12.0),
  );

}