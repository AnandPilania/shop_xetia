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
    this.response,
    this.meta,
  });

  List<ResponseCategory> response;
  MetaCategory meta;

  factory CategoryResponse.fromJson(Map<String, dynamic> json) =>
      CategoryResponse(
        response: json["response"] != null
            ? List<ResponseCategory>.from(
                json["response"].map((x) => ResponseCategory.fromJson(x)))
            : null,
        meta: MetaCategory.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "response": List<dynamic>.from(response.map((x) => x.toJson())),
        "meta": meta.toJson(),
      };
}

class MetaCategory {
  MetaCategory({
    this.code,
    this.status,
  });

  int code;
  String status;

  factory MetaCategory.fromJson(Map<String, dynamic> json) => MetaCategory(
        code: json["code"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
      };
}

class ResponseCategory {
  ResponseCategory({
    this.uuid,
    this.name,
  });

  String uuid;
  String name;

  factory ResponseCategory.fromJson(Map<String, dynamic> json) =>
      ResponseCategory(
        uuid: json["uuid"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "name": name,
      };
}
