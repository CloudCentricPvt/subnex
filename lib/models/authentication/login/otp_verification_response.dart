// To parse this JSON data, do
//
//     final otpVerificationResponse = otpVerificationResponseFromJson(jsonString);

import 'dart:convert';

import 'package:http/http.dart' as http;

OtpVerificationResponse otpVerificationResponseFromJson(String str) => OtpVerificationResponse.fromJson(json.decode(str));

String otpVerificationResponseToJson(OtpVerificationResponse data) => json.encode(data.toJson());

class OtpVerificationResponse {

  // -- Otp validation
  String? validateEnteredOtp(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter otp';
    } else if (value.length < 4) {
      return 'Otp must be 4 digits';
    }
    return null;
  }

  // -- Number validation
  String? validateEnteredNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter mobile number';
    } else if (value.length < 10) {
      return 'Number must be 10 digits';
    }
    return null;
  }

  // Method to log in using API
  Future<Map<String, dynamic>> validateOtp(var body, String apiUrl) async {
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(body),
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body); // Return response body as a map
      } else {
        return jsonDecode(response.body);
      }
    } catch (e) {
      return {
        'success': false,
        'message': 'An error occurred: $e',
      };
    }
  }

  // Method to log in using API
  Future<Map<String, dynamic>> resendOtp(var body, String apiUrl) async {
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
          'message': 'Resend Otp failed with status code ${response.statusCode}',
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
  String? authToken;
  String? userCode;
  User? user;
  String? apiUrl;
  String? apiVersion;

  OtpVerificationResponse({
    this.status,
    this.code,
    this.message,
    this.authToken,
    this.userCode,
    this.user,
    this.apiUrl,
    this.apiVersion,
  });

  factory OtpVerificationResponse.fromJson(Map<String, dynamic> json) => OtpVerificationResponse(
    status: json["status"],
    code: json["code"],
    message: json["message"],
    authToken: json["auth_token"],
    userCode: json["user_code"],
    user: json["user"] == null ? null : User.fromJson(json["user"]),
    apiUrl: json["api_url"],
    apiVersion: json["api_version"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "code": code,
    "message": message,
    "auth_token": authToken,
    "user_code": userCode,
    "user": user?.toJson(),
    "api_url": apiUrl,
    "api_version": apiVersion,
  };
}

class User {
  int? id;
  String? userCode;
  dynamic username;
  dynamic firstName;
  dynamic lastName;
  dynamic email;
  dynamic password;
  String? mobile;
  dynamic dateOfBirth;
  dynamic gender;
  dynamic profileImage;
  int? status;
  int? isDeleted;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? createdBy;
  String? updatedBy;
  int? otpVerified;

  User({
    this.id,
    this.userCode,
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.mobile,
    this.dateOfBirth,
    this.gender,
    this.profileImage,
    this.status,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.createdBy,
    this.updatedBy,
    this.otpVerified,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    userCode: json["user_code"],
    username: json["username"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    email: json["email"],
    password: json["password"],
    mobile: json["mobile"],
    dateOfBirth: json["date_of_birth"],
    gender: json["gender"],
    profileImage: json["profile_image"],
    status: json["status"],
    isDeleted: json["is_deleted"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    createdBy: json["created_by"],
    updatedBy: json["updated_by"],
    otpVerified: json["otp_verified"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_code": userCode,
    "username": username,
    "first_name": firstName,
    "last_name": lastName,
    "email": email,
    "password": password,
    "mobile": mobile,
    "date_of_birth": dateOfBirth,
    "gender": gender,
    "profile_image": profileImage,
    "status": status,
    "is_deleted": isDeleted,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "created_by": createdBy,
    "updated_by": updatedBy,
    "otp_verified": otpVerified,
  };
}
