import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as https;
import 'package:material_dialogs/widgets/buttons/icon_button.dart';

import '../utils/popups/k_material_dialogs.dart';
import '../utils/toasts/k_snackbar_events.dart';
import '../views/authentication/otp_screen.dart';
import 'k_base_api_services.dart';

class KNetworkApiServices extends KBaseApiServices {

  @override
  Future<dynamic> getRequest(String url) async {
    final localStorage = GetStorage();
    var auth = localStorage.read("Auth_Token");
    var userId = localStorage.read("User_Id");
    log("API Url: $url");
    log("UserId: $userId");
    log("AuthToken: $auth");
    final headers = {
      "Content-Type": "application/json",
      'auth_token': auth!.toString(),
      'user_code': userId!.toString()
    };
    dynamic responseJson;
    try {
      final response = await https.get(
            Uri.parse(url.toString()),
            headers: headers,
          ).timeout(const Duration(seconds: 10));
      responseJson = returnApiResponse(response);
      if (responseJson['status'] == false && responseJson['code'] == 301) {
        return KMaterialDialogs.sessionTimeOut(
            Get.context!,
            IconsButton(
              onPressed: () {
                final localStorage = GetStorage();
                localStorage.erase();
                Get.offAll(() => const OtpScreen());
              },
              text: 'Okay',
              color: Colors.red,
              textStyle: const TextStyle(color: Colors.white),
              iconColor: Colors.white,
            ),
            "Session time out!",
            "Your sessions has been expired, please do login again to continue.");
      }
    } on SocketException {
      throw KSnackBarEvents.errorSnackBar(
          title: "Opps", message: "No internet connectivity.");
    } on TimeoutException {
      throw KSnackBarEvents.errorSnackBar(
          title: "Opps", message: "Request timeout");
    } catch (e) {
      log("Catch On Get API");
      //throw KSnackBarEvents.errorSnackBar(title: "Opps", message: "Something went wrong");
    }
    return responseJson;
  }

  @override
  Future<dynamic> postRequest(var data, String url) async {
    final localStorage = GetStorage();
    var auth = localStorage.read("Auth_Token") ?? "";
    var userId = localStorage.read("User_Id") ?? "";
    final headers = {
      "Content-Type": "application/json",
      'auth_token': auth!.toString(),
      'user_code': userId!.toString()
    };
    log("User_Id: $userId");
    log("Auth_Token: $auth");
    log("API_URL : $url");
    log("Payload : $data");
    log("Header : $headers");

    dynamic responseJson;
    try {
      final response = await https
          .post(Uri.parse(url), body: data, headers: headers)
          .timeout(const Duration(seconds: 10));
      responseJson = returnApiResponse(response);
    } on SocketException {
      throw KSnackBarEvents.errorSnackBar(
          title: "Opps", message: "No internet found");
    } on TimeoutException {
      throw KSnackBarEvents.errorSnackBar(
          title: "Opps", message: "Request timeout");
    } catch (e) {
      throw KSnackBarEvents.errorSnackBar(
          title: "Error occurred network service", message: e.toString());
    }
    return responseJson;
  }

  @override
  Future<Map<String, dynamic>> httpPost(var data, String url) async {
    final localStorage = GetStorage();
    var auth = localStorage.read("Auth_Token") ?? "";
    var userId = localStorage.read("User_Id") ?? "";
    final headers = {
      "Content-Type": "application/json",
      'auth_token': auth!.toString(),
      'user_code': userId!.toString()
    };
    log("User_Id: $userId");
    log("Auth_Token: $auth");
    log("API_URL : $url");
    log("Payload : $data");
    log("Header : $headers");
    Map<String, dynamic> responseJson;
    try {
      final response = await https
          .post(Uri.parse(url), body: data, headers: headers)
          .timeout(const Duration(seconds: 10));
      responseJson = returnApiResponse(response);
    } on SocketException {
      throw KSnackBarEvents.errorSnackBar(
          title: "Opps", message: "No internet found");
    } on TimeoutException {
      throw KSnackBarEvents.errorSnackBar(
          title: "Opps", message: "Request timeout");
    } catch (e) {
      throw KSnackBarEvents.errorSnackBar(
          title: "Error occurred network service", message: e.toString());
    }
    return responseJson;
  }

  dynamic returnApiResponse(https.Response response) {
    log("GetAPIStatusCode : ${response.statusCode}");
    log("GetAPIResponse : ${response.body}");
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 401:
        throw KSnackBarEvents.errorSnackBar(
            title: "Opps", message: "Invalid request");
      case 400:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 404:
        return KMaterialDialogs.infoMaterialDialog(
            Get.context!,
            IconsButton(
              onPressed: () {
                Navigator.of(Get.context!).pop();
              },
              text: 'Okay',
              color: Colors.red,
              textStyle: const TextStyle(color: Colors.white),
              iconColor: Colors.white,
            ),
            "404",
            "Not found");
      default:
        throw KSnackBarEvents.errorSnackBar(
            title: "Opps",
            message: "Something went wrong, please try again later.");
    }
  }
}
