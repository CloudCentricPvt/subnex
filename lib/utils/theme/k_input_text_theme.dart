import 'package:flutter/material.dart';

import '../constants/k_colors.dart';

class KTextFormInputField {
  KTextFormInputField._();

  static InputDecorationTheme lightTextFormInputTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: Colors.grey,
    suffixIconColor: Colors.grey,

    /// Label Style
    labelStyle: const TextStyle().copyWith(
        fontSize: 13,
        color: KColors.appPrimaryGrey,
        fontWeight: FontWeight.w400),

    /// Hint Style
    hintStyle: const TextStyle().copyWith(
        fontSize: 13,
        color: KColors.appPrimaryGrey,
        fontWeight: FontWeight.normal),

    /// Error Style
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),

    /// FloatingLabel Style
    floatingLabelStyle: const TextStyle().copyWith(color: Colors.black.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(width: 1, color: Colors.black54)),
    errorBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(width: 1, color: Colors.red)),
    enabledBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(width: 1, color: Colors.black)),
    focusedBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(width: 1, color: Colors.black)),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(width: 1, color: Colors.redAccent)),
  );

  static InputDecorationTheme darkTextFormInputTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: Colors.grey,
    suffixIconColor: Colors.grey,

    /// Label Style
    labelStyle: TextStyle().copyWith(
        fontSize: 13, color: Colors.white, fontWeight: FontWeight.normal),

    /// Hint Style
    hintStyle: TextStyle().copyWith(
        fontSize: 13, color: Colors.white, fontWeight: FontWeight.normal),

    /// Error Style
    errorStyle: TextStyle()
        .copyWith(fontStyle: FontStyle.normal, fontWeight: FontWeight.normal),

    /// FloatingLabel Style
    floatingLabelStyle:
        TextStyle().copyWith(color: Colors.white.withOpacity(0.8)),
    border: OutlineInputBorder().copyWith(
        //borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(width: 1, color: Colors.grey)),
    errorBorder: OutlineInputBorder().copyWith(
        //borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(width: 1, color: KColors.appPrimary)),
    enabledBorder: OutlineInputBorder().copyWith(
        //borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(width: 1, color: Colors.grey)),
    focusedBorder: OutlineInputBorder().copyWith(
        //borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(width: 1, color: Colors.white)),
    focusedErrorBorder: OutlineInputBorder().copyWith(
        //borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(width: 2, color: KColors.appPrimary)),
  );
}
