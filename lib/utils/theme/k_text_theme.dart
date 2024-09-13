import 'package:flutter/material.dart';

class KTextTheme {
  KTextTheme._(); // To avoid crating instances.

  static TextTheme kTextThemeLight = const TextTheme(
    /// Displays - for slightly bold text
    displayLarge: TextStyle(
        fontFamily: 'Plus Jakarta Sans',
        fontSize: 22.0,
        fontWeight: FontWeight.w700,
        color: Colors.black),
    displayMedium: TextStyle(
        fontFamily: 'Plus Jakarta Sans',
        fontSize: 20.0,
        fontWeight: FontWeight.w700,
        color: Colors.black),
    displaySmall: TextStyle(
        fontFamily: 'Plus Jakarta Sans',
        fontSize: 18.0,
        fontWeight: FontWeight.w700,
        color: Colors.black),

    /// Headlines
    headlineLarge: TextStyle(
        fontFamily: 'Plus Jakarta Sans',
        fontSize: 22.0,
        fontWeight: FontWeight.w600,
        color: Colors.black),
    headlineMedium: TextStyle(
        fontFamily: 'Plus Jakarta Sans',
        fontSize: 20.0,
        fontWeight: FontWeight.w600,
        color: Colors.black),
    // ---- Heading titles ---- //
    headlineSmall: TextStyle(
        fontFamily: 'Plus Jakarta Sans',
        fontSize: 18.0,
        fontWeight: FontWeight.w600,
        color: Colors.black),

    /// Titles
    // ---- Heading titles ---- //
    titleLarge: TextStyle(
        fontFamily: 'Plus Jakarta Sans',
        fontSize: 18.0,
        fontWeight: FontWeight.w600,
        color: Colors.black),
    // ---- AppBar Title, List tile title ---- //
    titleMedium: TextStyle(
        fontFamily: 'Plus Jakarta Sans',
        fontSize: 17.0,
        fontWeight: FontWeight.w500,
        color: Colors.black),
    // ---- Buttons ---- //
    titleSmall: TextStyle(
        fontFamily: 'Plus Jakarta Sans',
        fontSize: 16.0,
        fontWeight: FontWeight.w400,
        color: Colors.black),

    /// Bodies
    bodyLarge: TextStyle(
        fontFamily: 'Plus Jakarta Sans',
        fontSize: 15.0,
        fontWeight: FontWeight.w600,
        color: Colors.black),
    // ---- Detail Page ---- //
    bodyMedium: TextStyle(
        fontFamily: 'Plus Jakarta Sans',
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
        color: Colors.black),
    // ---- List tile subtitle ---- //
    bodySmall: TextStyle(
        fontFamily: 'Plus Jakarta Sans',
        fontSize: 13.0,
        fontWeight: FontWeight.w400,
        color: Colors.black),

    /// Labels
    labelLarge: TextStyle(
        fontFamily: 'Plus Jakarta Sans',
        fontSize: 12.0,
        fontWeight: FontWeight.normal,
        color: Colors.black),
    labelMedium: TextStyle(
        fontFamily: 'Plus Jakarta Sans',
        fontSize: 11.0,
        fontWeight: FontWeight.normal,
        color: Colors.black),
    labelSmall: TextStyle(
        fontFamily: 'Plus Jakarta Sans',
        fontSize: 10.0,
        fontWeight: FontWeight.normal,
        color: Colors.black),
  );

  static TextTheme kTextThemeDark = const TextTheme(
    /// Display
    displayLarge: TextStyle(
        fontFamily: 'Plus Jakarta Sans',
        fontSize: 22.0,
        fontWeight: FontWeight.w700,
        color: Colors.white),
    displayMedium: TextStyle(
        fontFamily: 'Plus Jakarta Sans',
        fontSize: 20.0,
        fontWeight: FontWeight.w700,
        color: Colors.white),
    displaySmall: TextStyle(
        fontFamily: 'Plus Jakarta Sans',
        fontSize: 18.0,
        fontWeight: FontWeight.w700,
        color: Colors.white),

    /// Headlines
    headlineLarge: TextStyle(
        fontFamily: 'Plus Jakarta Sans',
        fontSize: 22.0,
        fontWeight: FontWeight.w600,
        color: Colors.white),
    headlineMedium: TextStyle(
        fontFamily: 'Plus Jakarta Sans',
        fontSize: 20.0,
        fontWeight: FontWeight.w600,
        color: Colors.white),
    headlineSmall: TextStyle(
        fontFamily: 'Plus Jakarta Sans',
        fontSize: 18.0,
        fontWeight: FontWeight.w600,
        color: Colors.white),

    /// Titles
    titleLarge: TextStyle(
        fontFamily: 'Plus Jakarta Sans',
        fontSize: 18.0,
        fontWeight: FontWeight.w600,
        color: Colors.white),
    titleMedium: TextStyle(
        fontFamily: 'Plus Jakarta Sans',
        fontSize: 17.0,
        fontWeight: FontWeight.w500,
        color: Colors.white),
    titleSmall: TextStyle(
        fontFamily: 'Plus Jakarta Sans',
        fontSize: 16.0,
        fontWeight: FontWeight.w400,
        color: Colors.white),

    /// Bodies
    bodyLarge: TextStyle(
        fontFamily: 'Plus Jakarta Sans',
        fontSize: 15.0,
        fontWeight: FontWeight.w600,
        color: Colors.white),
    bodyMedium: TextStyle(
        fontFamily: 'Plus Jakarta Sans',
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
        color: Colors.white),
    bodySmall: TextStyle(
        fontFamily: 'Plus Jakarta Sans',
        fontSize: 13.0,
        fontWeight: FontWeight.w400,
        color: Colors.white),

    /// Labels
    labelLarge: TextStyle(
        fontFamily: 'Plus Jakarta Sans',
        fontSize: 12.0,
        fontWeight: FontWeight.normal,
        color: Colors.white),
    labelMedium: TextStyle(
        fontFamily: 'Plus Jakarta Sans',
        fontSize: 11.0,
        fontWeight: FontWeight.normal,
        color: Colors.white),
    labelSmall: TextStyle(
        fontFamily: 'Plus Jakarta Sans',
        fontSize: 10.0,
        fontWeight: FontWeight.normal,
        color: Colors.white),
  );
}
