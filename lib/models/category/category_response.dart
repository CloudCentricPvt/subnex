// To parse this JSON data, do
//
//     final categoryResponse = categoryResponseFromJson(jsonString);

import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:subnex/utils/constants/api_container.dart';

import '../../network/k_network_api_services.dart';

CategoryResponse categoryResponseFromJson(String str) =>
    CategoryResponse.fromJson(json.decode(str));

String categoryResponseToJson(CategoryResponse data) =>
    json.encode(data.toJson());

class CategoryResponse {
  final kNetworkApiService = KNetworkApiServices();

  Future<List<CategoryList>> fetchCategories(String apiUrl) async {
    final response = await kNetworkApiService.getRequest(apiUrl);

    if (response['status'] == true) {
      List<CategoryList> categories = (response['category_list'] as List)
          .map((item) => CategoryList.fromJson(item))
          .toList();
      return categories;
    } else {
      throw Exception('Failed to load categories');
    }
  }

  bool? status;
  int? code;
  String? message;
  List<CategoryList>? categoryList;
  String? apiUrl;
  String? apiVersion;

  CategoryResponse({
    this.status,
    this.code,
    this.message,
    this.categoryList,
    this.apiUrl,
    this.apiVersion,
  });

  factory CategoryResponse.fromJson(Map<String, dynamic> json) =>
      CategoryResponse(
        status: json["status"],
        code: json["code"],
        message: json["message"],
        categoryList: json["category_list"] == null
            ? []
            : List<CategoryList>.from(
                json["category_list"]!.map((x) => CategoryList.fromJson(x))),
        apiUrl: json["api_url"],
        apiVersion: json["api_version"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "message": message,
        "category_list": categoryList == null
            ? []
            : List<dynamic>.from(categoryList!.map((x) => x.toJson())),
        "api_url": apiUrl,
        "api_version": apiVersion,
      };
}

class CategoryList {
  int? id;
  String? categoryCode;
  int? parentId;
  String? name;
  String? description;
  String? imageName;
  String? imagePath;
  int? status;
  int? isDeleted;
  DateTime? createdAt;
  DateTime? updatedAt;
  AtedBy? createdBy;
  AtedBy? updatedBy;

  CategoryList({
    this.id,
    this.categoryCode,
    this.parentId,
    this.name,
    this.description,
    this.imageName,
    this.imagePath,
    this.status,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.createdBy,
    this.updatedBy,
  });

  factory CategoryList.fromJson(Map<String, dynamic> json) => CategoryList(
        id: json["id"],
        categoryCode: json["category_code"],
        parentId: json["parent_id"],
        name: json["name"],
        description: json["description"],
        imageName: json["image_name"],
        imagePath: json["image_path"],
        status: json["status"],
        isDeleted: json["is_deleted"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        createdBy: atedByValues.map[json["created_by"]]!,
        updatedBy: atedByValues.map[json["updated_by"]]!,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category_code": categoryCode,
        "parent_id": parentId,
        "name": name,
        "description": description,
        "image_name": imageName,
        "image_path": imagePath,
        "status": status,
        "is_deleted": isDeleted,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "created_by": atedByValues.reverse[createdBy],
        "updated_by": atedByValues.reverse[updatedBy],
      };
}

enum AtedBy { AFRD_RP4_GX_GQ_MY2_Q6_DO2_M_H2_R_L_BLJPE_ABA4_D_MIN }

final atedByValues = EnumValues({
  "afrdRp4gxGqMy2q6do2mH2rLBljpeABA4dMin":
      AtedBy.AFRD_RP4_GX_GQ_MY2_Q6_DO2_M_H2_R_L_BLJPE_ABA4_D_MIN
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
