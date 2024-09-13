import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class KThemeController extends GetxController{

  var localStorage = GetStorage();

  void switchTheme(){
    if(localStorage.read("ThemeMode") == null || localStorage.read("ThemeMode") == ""){
      localStorage.write("ThemeMode", "Dark_Theme");
      Get.changeThemeMode(ThemeMode.dark);
      update();
    }else if(localStorage.read("ThemeMode") == "Dark_Theme"){
      localStorage.write("ThemeMode", "Light_Theme");
      Get.changeThemeMode(ThemeMode.light);
      update();
    }else if(localStorage.read("ThemeMode") == "Light_Theme"){
      localStorage.write("ThemeMode", "Dark_Theme");
      Get.changeThemeMode(ThemeMode.dark);
      update();
    }
  }

  ThemeMode get themeMode => localStorage.read("ThemeMode") == "Dark_Theme" ? ThemeMode.dark : ThemeMode.light;

}