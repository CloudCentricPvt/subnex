import 'package:flutter/material.dart';

import '../constants/k_colors.dart';

class KCheckboxTheme {
  KCheckboxTheme._();

  static CheckboxThemeData lightCheckboxTheme = CheckboxThemeData(
      checkColor : MaterialStateProperty.resolveWith((states) {
        if(states.contains(MaterialState.selected)){
          return Colors.white;
        }else{
          return Colors.black;
        }
      }),
      fillColor : MaterialStateProperty.resolveWith((states) {
        if(states.contains(MaterialState.selected)){
          return KColors.appPrimary;
        }else{
          return Colors.transparent;
        }
      }),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)));

  static CheckboxThemeData darkCheckboxTheme = CheckboxThemeData(
      checkColor : MaterialStateProperty.resolveWith((states) {
        if(states.contains(MaterialState.selected)){
          return Colors.white;
        }else{
          return Colors.black;
        }
      }),
      fillColor : MaterialStateProperty.resolveWith((states) {
        if(states.contains(MaterialState.selected)){
          return KColors.appPrimary;
        }else{
          return Colors.transparent;
        }
      }),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)));
}
