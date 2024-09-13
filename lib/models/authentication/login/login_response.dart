// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';
import 'package:http/http.dart' as http;


import '../../../network/k_network_api_services.dart';

LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {

  final kNetworkApiService = KNetworkApiServices();

  // -- Number validation
  String? validateNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter mobile number';
    } else if (value.length < 10) {
      return 'Number must be 10 digits';
    }
    return null;
  }

  // Method to log in using API
  Future<Map<String, dynamic>> login(var body, String apiUrl) async {

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body); // Return response body as a map
      } else {
        return {
          'success': false,
          'message': 'Login failed with status code ${response.statusCode}',
        };
      }
    } catch (e) {
      return {
        'success': false,
        'message': 'An error occurred: $e',
      };
    }
  }



  bool? status;
  int? code;
  String? message;
  String? apiUrl;
  String? apiVersion;

  LoginResponse({
    this.status,
    this.code,
    this.message,
    this.apiUrl,
    this.apiVersion,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        status: json["status"],
        code: json["code"],
        message: json["message"],
        apiUrl: json["api_url"],
        apiVersion: json["api_version"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "message": message,
        "api_url": apiUrl,
        "api_version": apiVersion,
      };
}
