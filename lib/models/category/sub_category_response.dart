// To parse this JSON data, do
//
//     final subCategoryResponse = subCategoryResponseFromJson(jsonString);

import 'dart:convert';
import '../../network/k_network_api_services.dart';

SubCategoryResponse subCategoryResponseFromJson(String str) => SubCategoryResponse.fromJson(json.decode(str));

String subCategoryResponseToJson(SubCategoryResponse data) => json.encode(data.toJson());

class SubCategoryResponse {

  final kNetworkApiService = KNetworkApiServices();

  Future<List<SubCategoryList>> fetchSubCategories(String apiUrl) async {
    final response = await kNetworkApiService.getRequest(apiUrl);
      if (response['status'] == true) {
        List<SubCategoryList> subCategories = (response['sub_category_list'] as List)
            .map((item) => SubCategoryList.fromJson(item))
            .toList();
        return subCategories;
      } else {
        throw Exception('Failed to load categories');
      }
  }

  bool? status;
  int? statusCode;
  String? message;
  List<SubCategoryList>? subCategoryList;
  String? apiUrl;
  String? apiVersion;

  SubCategoryResponse({
    this.status,
    this.statusCode,
    this.message,
    this.subCategoryList,
    this.apiUrl,
    this.apiVersion,
  });

  factory SubCategoryResponse.fromJson(Map<String, dynamic> json) => SubCategoryResponse(
    status: json["status"],
    statusCode: json["statusCode"],
    message: json["message"],
    subCategoryList: json["sub_category_list"] == null ? [] : List<SubCategoryList>.from(json["sub_category_list"]!.map((x) => SubCategoryList.fromJson(x))),
    apiUrl: json["api_url"],
    apiVersion: json["api_version"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "statusCode": statusCode,
    "message": message,
    "sub_category_list": subCategoryList == null ? [] : List<dynamic>.from(subCategoryList!.map((x) => x.toJson())),
    "api_url": apiUrl,
    "api_version": apiVersion,
  };
}

class SubCategoryList {
  int? id;
  String? subCategoryCode;
  String? name;
  String? description;
  int? categoryId;
  dynamic imageName;
  dynamic imagePath;
  int? status;
  int? isDeleted;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic createdBy;
  dynamic updatedBy;

  SubCategoryList({
    this.id,
    this.subCategoryCode,
    this.name,
    this.description,
    this.categoryId,
    this.imageName,
    this.imagePath,
    this.status,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.createdBy,
    this.updatedBy,
  });

  factory SubCategoryList.fromJson(Map<String, dynamic> json) => SubCategoryList(
    id: json["id"],
    subCategoryCode: json["sub_category_code"],
    name: json["name"],
    description: json["description"],
    categoryId: json["category_id"],
    imageName: json["image_name"],
    imagePath: json["image_path"],
    status: json["status"],
    isDeleted: json["is_deleted"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    createdBy: json["created_by"],
    updatedBy: json["updated_by"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "sub_category_code": subCategoryCode,
    "name": name,
    "description": description,
    "category_id": categoryId,
    "image_name": imageName,
    "image_path": imagePath,
    "status": status,
    "is_deleted": isDeleted,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "created_by": createdBy,
    "updated_by": updatedBy,
  };
}
