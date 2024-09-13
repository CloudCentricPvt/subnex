import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class KHelperFunctions {
  KHelperFunctions._();
  static Color? getColor(String value) {
    if (value == "Green") {
      return Colors.green;
    } else if (value == "Red") {
      return Colors.red;
    } else if (value == "Orange") {
      return Colors.orange;
    } else if (value == "Yellow") {
      return Colors.yellow;
    } else if (value == "Black") {
      return Colors.black;
    } else if (value == "White") {
      return Colors.white;
    } else if (value == "Blue") {
      return Colors.blue;
    }
    return null;
  }

  static void navigateToScreen(BuildContext context, Widget screen) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
  }

  /// --- App Configurations & Device Info

  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static void hideKeyBoard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  static Size screenSize() {
    return MediaQuery.of(Get.context!).size;
  }

  static double screenHeight() {
    return MediaQuery.of(Get.context!).size.height;
  }

  static double screenWidth() {
    return MediaQuery.of(Get.context!).size.width;
  }

  /// --- Toasts and Snackbars

  static void showSnackBar(String message) {
    ScaffoldMessenger.of(Get.context!)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  static void showAlert(String title, String message) {
    showDialog(
        context: Get.context!,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: [
              TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text("Ok"))
            ],
          );
        });
  }

  /// -- DateTime

  static String getFormattedDate(DateTime date,
      {String format = 'dd MMM yyyy'}) {
    return DateFormat(format).format(date);
  }

  static String getCurrentDate() {
    var now = new DateTime.now();
    var formatter = new DateFormat('dd-MM-yyyy');
    var formattedDate = formatter.format(now);
    return formattedDate.toString();
  }

  static String getCurrentDateReverseFormat() {
    var now = new DateTime.now();
    var formatter = new DateFormat('yyyy-MM-dd');
    var formattedDate = formatter.format(now);
    return formattedDate.toString();
  }

}
