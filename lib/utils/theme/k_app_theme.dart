import 'package:flutter/material.dart';
import '../constants/k_colors.dart';
import 'k_app_bar_theme.dart';
import 'k_bottom_sheet_theme.dart';
import 'k_checkbox_theme.dart';
import 'k_chip_theme.dart';
import 'k_elevated_button_theme.dart';
import 'k_input_text_theme.dart';
import 'k_outline_button_theme.dart';
import 'k_text_theme.dart';

class KAppTheme {
  KAppTheme._(); // To avoid creating instances.

  // Light Mode Theme
  static ThemeData kLightTheme = ThemeData(
      //colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
      //useMaterial3: true,
      fontFamily: 'Inter',
      brightness: Brightness.light,
      primaryColor: KColors.appPrimary,
      scaffoldBackgroundColor: Colors.white,
      textTheme: KTextTheme.kTextThemeLight,
      elevatedButtonTheme: KElevatedButtonTheme.kElevatedButtonThemeLight,
      appBarTheme: KAppBarTheme.lightAppBarTheme,
      bottomSheetTheme: KBottomSheetTheme.lightBottomSheetTheme,
      checkboxTheme: KCheckboxTheme.lightCheckboxTheme,
      chipTheme: KChipTheme.lightChipTheme,
      inputDecorationTheme: KTextFormInputField.lightTextFormInputTheme,
      outlinedButtonTheme: KOutlineButtonTheme.lightOutlineButtonTheme);

  // Dark Mode Theme
  static ThemeData kDarkTheme = ThemeData(
      //colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
      //useMaterial3: true,
      fontFamily: 'Inter',
      brightness: Brightness.dark,
      primaryColor: KColors.appPrimary,
      scaffoldBackgroundColor: Colors.black,
      textTheme: KTextTheme.kTextThemeDark,
      elevatedButtonTheme: KElevatedButtonTheme.kElevatedButtonThemeDark,
      appBarTheme: KAppBarTheme.darkAppBarTheme,
      bottomSheetTheme: KBottomSheetTheme.darkBottomSheetTheme,
      checkboxTheme: KCheckboxTheme.darkCheckboxTheme,
      chipTheme: KChipTheme.darkChipTheme,
      inputDecorationTheme: KTextFormInputField.darkTextFormInputTheme,
      outlinedButtonTheme: KOutlineButtonTheme.darkOutlineButtonTheme);
}
