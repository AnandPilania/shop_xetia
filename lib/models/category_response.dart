// To parse this JSON data, do
//
//     final categoryResponse = categoryResponseFromJson(jsonString);

import 'dart:convert';

CategoryResponse categoryResponseFromJson(String str) =>
    CategoryResponse.fromJson(json.decode(str));

String categoryResponseToJson(CategoryResponse data) =>
    json.encode(data.toJson());

class CategoryResponse {
  CategoryResponse({
    this.meta,
  });

  PostMetaCategory meta;

  factory CategoryResponse.fromJson(Map<String, dynamic> json) =>
      CategoryResponse(
        meta: PostMetaCategory.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "meta": meta.toJson(),
      };
}

class PostMetaCategory {
  PostMetaCategory({
    this.code,
    this.status,
  });

  int code;
  String status;

  factory PostMetaCategory.fromJson(Map<String, dynamic> json) =>
      PostMetaCategory(
        code: json["code"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
      };
}
