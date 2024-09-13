// To parse this JSON data, do
//
//     final userDetailResponse = userDetailResponseFromJson(jsonString);

import 'dart:convert';
import 'dart:developer';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import '../../../network/k_network_api_services.dart';


UserDetailResponse userDetailResponseFromJson(String str) => UserDetailResponse.fromJson(json.decode(str));

String userDetailResponseToJson(UserDetailResponse data) => json.encode(data.toJson());

class UserDetailResponse {


  final kNetworkApiService = KNetworkApiServices();

  Future<dynamic> getUserDetail(String apiUrl) async {
    try {
      final response = await kNetworkApiService.getRequest(apiUrl);
      if (response['status']) {
        return UserDetailResponse.fromJson(response);
      } else {
        throw Exception('Failed to load user detail');
      }
    } catch (e) {
      log("Error : $e");
      throw Exception('Failed to load user detail1');
    }
  }

  // Method to log in using API
  Future<Map<String, dynamic>> updateUserProfile(var body, String apiUrl) async {
    try {
      final response = await kNetworkApiService.httpPost(json.encode(body), apiUrl);
      if (response['status'] == true) {
        return response; // Return response body as a map
      } else {
        return {
          'success': false,
          'message':
          'User Update failed with status code ${response['code']}',
        };
      }
    } catch (e) {
      log("Code3 : $e");
      return {
        'success': false,
        'message': 'An error occurred: $e',
      };
    }
  }

  bool? status;
  int? code;
  String? message;
  String? profileComplete;
  UserDetails? userDetails;
  String? apiUrl;
  String? apiVersion;

  UserDetailResponse({
    this.status,
    this.code,
    this.message,
    this.profileComplete,
    this.userDetails,
    this.apiUrl,
    this.apiVersion,
  });

  factory UserDetailResponse.fromJson(Map<String, dynamic> json) => UserDetailResponse(
    status: json["status"],
    code: json["code"],
    message: json["message"],
    profileComplete: json["profile_complete"],
    userDetails: json["user_details"] == null ? null : UserDetails.fromJson(json["user_details"]),
    apiUrl: json["api_url"],
    apiVersion: json["api_version"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "code": code,
    "message": message,
    "profile_complete": profileComplete,
    "user_details": userDetails?.toJson(),
    "api_url": apiUrl,
    "api_version": apiVersion,
  };
}

class UserDetails {
  int? id;
  String? userCode;
  String? username;
  String? firstName;
  String? lastName;
  String? email;
  dynamic password;
  String? mobile;
  DateTime? dateOfBirth;
  String? gender;
  String? profileImage;
  int? status;
  int? isDeleted;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? createdBy;
  String? updatedBy;
  int? otpVerified;
  UserAddress? userAddress;

  UserDetails({
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
    this.userAddress,
  });

  factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
    id: json["id"],
    userCode: json["user_code"],
    username: json["username"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    email: json["email"],
    password: json["password"],
    mobile: json["mobile"],
    dateOfBirth: json["date_of_birth"] == null ? null : DateTime.parse(json["date_of_birth"]),
    gender: json["gender"],
    profileImage: json["profile_image"],
    status: json["status"],
    isDeleted: json["is_deleted"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    createdBy: json["created_by"],
    updatedBy: json["updated_by"],
    otpVerified: json["otp_verified"],
    userAddress: json["user_address"] == null ? null : UserAddress.fromJson(json["user_address"]),
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
    "date_of_birth": dateOfBirth?.toIso8601String(),
    "gender": gender,
    "profile_image": profileImage,
    "status": status,
    "is_deleted": isDeleted,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "created_by": createdBy,
    "updated_by": updatedBy,
    "otp_verified": otpVerified,
    "user_address": userAddress?.toJson(),
  };
}

class UserAddress {
  int? id;
  String? addressCode;
  int? userId;
  String? userCode;
  String? address;
  dynamic streetAddress1;
  dynamic streetAddress2;
  dynamic state;
  dynamic city;
  dynamic pincode;
  int? isDefault;
  int? isHome;
  dynamic latLong;
  int? status;
  int? isDeleted;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? createdBy;
  String? updatedBy;

  UserAddress({
    this.id,
    this.addressCode,
    this.userId,
    this.userCode,
    this.address,
    this.streetAddress1,
    this.streetAddress2,
    this.state,
    this.city,
    this.pincode,
    this.isDefault,
    this.isHome,
    this.latLong,
    this.status,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.createdBy,
    this.updatedBy,
  });

  factory UserAddress.fromJson(Map<String, dynamic> json) => UserAddress(
    id: json["id"],
    addressCode: json["address_code"],
    userId: json["user_id"],
    userCode: json["user_code"],
    address: json["address"],
    streetAddress1: json["street_address1"],
    streetAddress2: json["street_address2"],
    state: json["state"],
    city: json["city"],
    pincode: json["pincode"],
    isDefault: json["is_default"],
    isHome: json["is_home"],
    latLong: json["lat_long"],
    status: json["status"],
    isDeleted: json["is_deleted"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    createdBy: json["created_by"],
    updatedBy: json["updated_by"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "address_code": addressCode,
    "user_id": userId,
    "user_code": userCode,
    "address": address,
    "street_address1": streetAddress1,
    "street_address2": streetAddress2,
    "state": state,
    "city": city,
    "pincode": pincode,
    "is_default": isDefault,
    "is_home": isHome,
    "lat_long": latLong,
    "status": status,
    "is_deleted": isDeleted,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "created_by": createdBy,
    "updated_by": updatedBy,
  };
}

